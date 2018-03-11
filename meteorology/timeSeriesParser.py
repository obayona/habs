import sys;
import os;
import commands;
import csv;
from geonode.meteorology.models import Station,Unit,Variable,TimeSerie,Entry;

mapDate = {
	"ENERO":1,
	"FEBRERO":2,
	"MARZO":3,
	"ABRIL":4,
	"MAYO":5,
	"JUNIO":6,
	"JULIO":7,
	"AGOSTO":8,
	"SEPTIEMBRE":9,
	"OCTUBRE":10,
	"NOVIEMBRE":11,
	"DICIEMBRE":12
};

t = TimeSerie.objects.all();
fileName = "entries.csv";


def saveEntries(ts,fileName):
	
	data = open(fileName,'r').read()
	data = data.split('\r')
	for line in data:
		try:
			row = line.split(";")
			value = row[2]
			value = value.replace(",",".")
			value = float(value)
			year = int(row[0])
			month = mapDate[row[1]]
			entry = Entry(value=value,year=year,month=month,timeSeries=ts);
			entry.save()
		except:
			print "Error en",line; 
	


#fileName = "entries.csv";
print "Eloy"

saveEntries(t[0],fileName);
saveEntries(t[1],fileName);
