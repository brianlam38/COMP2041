#!/usr/bin/python3

#
# Allow COMP[29]041 students  to enter peer assessments of each other's work
# And see what peer assessment have been entered of them.
#

import collections, glob, os,re
from flask import Flask, session, render_template, request

# peer assessments are stored in this directory

ASSESSMENTS_DIRECTORY = 'assessments'

# this file contain one line for each COMP[29]041 student
# each line contains zid:name:password

STUDENT_DETAILS_FILE = 'students.txt'

app = Flask(__name__, template_folder='.')

# display initial page request zid/password

@app.route('/', methods=['GET'])
def start():
	return render_template('peer_login.html')

# if zid/password authenticates
# return a page which allows a student to peer assess another student
# or see other students assessment of them

@app.route('/login', methods=['POST'])
def login():
	zid = request.form.get('zid', '')
	password = request.form.get('password', '')
	zid = re.sub(r'\D', '', zid)
	with open("curr_id.txt", "w") as f:
		f.write(zid)	
	# store zid in session cookie
	session['zid'] = zid
	student_details = read_student_details()
	
	wrongpw = ""
	print(password)
	print(student_details[zid]["password"])
	if password != student_details[zid]["password"]:
		wrongpw = "Wrong username or password"
		return render_template('peer_login.html', error=wrongpw)
	
	return render_template('peer_select_student.html', students=student_details)


# return a page allowing a peer assessment of the selected student
# to be entered

@app.route('/enter_grade', methods=['POST'])
def enter_grade():

	# check we have previous autheticated zid in session cookie
	if 'zid' not in session:
		return render_template('peer_login.html')
	
	student_assessed_zid = request.form.get('student_assessed', '')
	
	student_details = read_student_details()
	
	session['student_assessed_zid'] = student_assessed_zid
	student_assessed_name = student_details[student_assessed_zid]['name']
	
	assessment_file = os.path.join(ASSESSMENTS_DIRECTORY, student_assessed_zid + '.' + session['zid'])
	try:
		with open(assessment_file) as f:
			current_grade = f.read()
	except OSError:
		current_grade = ''
		
	return render_template('peer_enter_grade.html',
							name=student_assessed_name,
							number=student_assessed_zid,
							grade_descriptions=possible_grades,
							existing_grade=current_grade)


# save a peer assessment of the selected student

@app.route('/save_grade', methods=['POST'])
def save_grade():
	# check we have a previous authenticated zid in session cookie
	if 'zid' not in session:
		return render_template('peer_login.html')
	
	student_assessed_zid = session.get('student_assessed_zid', '')
	student_details = read_student_details()
	student_assessed_name = student_details[student_assessed_zid]['name']

	assessment_file = os.path.join(ASSESSMENTS_DIRECTORY, student_assessed_zid + '.' + session['zid'])
	grade = request.form.get('grade', '')
	with open(assessment_file,"w") as f:
			f.write(grade)

	return render_template('peer_select_student.html',
							students=student_details,
							message='A peer assessment of ' + grade + ' has been saved for ' + student_assessed_name)

@app.route('/assessments', methods=['GET', 'POST'])
def peer_assess():
	if 'zid' not in session:
		return render_template('peer_login.html')
	# opened stored file with current user id
	with open("curr_id.txt", "r") as f:
		id = f.read()
	print(id)
	# create peer assessment id list
	list = []
	grades = []
	student_details = read_student_details()
	# grab all assessors ids
	for filename in os.listdir(ASSESSMENTS_DIRECTORY):
		if re.match(id, filename):
			assessment_file = os.path.join(ASSESSMENTS_DIRECTORY, filename)
			# grab all assessor grades
			with open(assessment_file, "r") as f:
				grade = f.read()
				grades.append(grade)
			other_student = re.sub(id + r"\.", "", filename)
			details = student_details[other_student]
			# form final string to output and append to list
			final_str = grade + " from " + other_student + " " + details["name"]
			list.append(final_str)

	# grab median grade
	num_grades = len(grades)
	if num_grades % 2 == 1:
		median = grades[int(num_grades/2)]
	if num_grades % 2 == 0:
		median = grades[num_grades/2 - 1]

	return render_template('peer_assessments.html', list=list, med=median)
	

# read the student details file
# return it as a dict (an OrderedDict sorted on name)

def read_student_details():
	with open(STUDENT_DETAILS_FILE) as f:
		students = [line.strip().split(':') for line in f]
	sorted_students = sorted(students, key=lambda student: student[1]) 
	student_details = collections.OrderedDict()
	for (zid, name, password) in sorted_students:
		student_details[zid] = {'name': name, 'password' : password}
	return student_details
	

# read the student details file
# return it as a dict (an OrderedDict sorted on name)

possible_grades = collections.OrderedDict([
	('A', 'working correctly'),
	('B', 'minor problems'),
	('C', 'major problems but significant part works'),
	('D', 'any part works'),
	('E', 'attempted but not working')
	])

# start flask as webserver

if __name__ == '__main__':
	app.secret_key = os.urandom(12)
	app.run(debug=True, port=3166)
