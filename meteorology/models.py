from django.db import models


class Station(models.Model):
	code = models.CharField(max_length=6)
	name = models.CharField(max_length=30)
	province = models.CharField(max_length=50)
	longitude = models.FloatField()
	latitude = models.FloatField()
	elevation = models.FloatField()

class Unit(models.Model):
	representation = models.CharField(max_length=10)
	description = models.CharField(max_length=150)

"""

class TimeSerie(models.Model):
	description = models.CharField(max_length=50)	
	variable = models.CharField(max_length=30)
	unit = models.ForeignKey('Unit',on_delete=models.PROTECT)
	station = models.ForeignKey('Station',on_delete=models.CASCADE)

"""

class Variable(models.Model):
	name= models.CharField(max_length=30)
	description = models.CharField(max_length=50)	
	unit = models.ForeignKey('Unit',on_delete=models.PROTECT)
	station = models.ForeignKey('Station',on_delete=models.CASCADE)


class TimeSerie(models.Model):
	name = models.CharField(max_length=20)	
	variable = models.ForeignKey('Variable',on_delete=models.CASCADE)


class Entry(models.Model):
	value = models.FloatField()
	year = models.IntegerField()
	month = models.IntegerField() 
	timeSeries = models.ForeignKey('TimeSerie',on_delete=models.CASCADE)	
	
