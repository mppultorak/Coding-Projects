# Student.py
# Name: Michael Pultorak
# Date: 04/16/21

class Student:
    """Student class which can keep track of student data    
    (name, total credit hours, and total quality points. It 
    can also calculate gpa"""
       

    def __init__(self, name, hours, qpoints):
        """Initialize name, credit hours, and quality points"""
        self.name = name
        self.hours = float(hours)
        self.qpoints = float(qpoints)

    def getName(self):
        """Return student's name"""
        return self.name

    def getHours(self):
        """Return total credit hours"""
        return self.hours

    def getQPoints(self):
        """Return total quality points"""
        return self.qpoints

    def gpa(self):
        """Calculate and return gpa"""
        return self.qpoints/self.hours

    def add_grade (self, grade_point, credits):
        """Add a new course information (Credit hours and Quality 
        Points)"""
        self.hours = self.hours + credits
        self.qpoints = self.qpoints + grade_point
