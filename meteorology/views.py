import json, requests
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.core import serializers
from django.template import RequestContext
from models import Station,Unit,Variable,TimeSerie,Entry

def index(request):
	return render_to_response('meteorology/index.html',RequestContext(request,{},))

def stations(request):
	stations = Station.objects.all();
	return HttpResponse(serializers.serialize("json",stations), content_type='application/json')

def station(request,station_id):
	station_id = int(station_id);
	station=Station.objects.get(pk = station_id);

	data = {}
	data["code"] = station.code
	data["name"] = station.name
	data["province"] = station.province
	data["longitude"] = station.longitude
	data["latitude"] = station.latitude
	data["elevation"] = station.elevation
	data["pk"] = station.pk

	return render_to_response('meteorology/station.html',RequestContext(request,{"data":data},))


def variables(request,station_id):
	station_id = int(station_id);
	variablesList = Variable.objects.filter(station_id = station_id);
	elements = [];
	for variable in variablesList:
		v = {};
		v["pk"] = variable.pk;
		v["name"] = variable.name;
		v["description"] = variable.description;
		u = {};
		u["representation"] = variable.unit.representation;
		u["description"] = variable.unit.description;
		v["unit"] = u;
		elements.append(v)

	data = {"variables":elements};
	return HttpResponse(json.dumps(data), content_type='application/json')


def timeSeries(request,variable_id):
	variable_id = int(variable_id);
	timeSeries = TimeSerie.objects.filter(variable = variable_id);
	series = []
	for ts in timeSeries:
		timeSerie = {}
		timeSerie["pk"] = ts.pk
		timeSerie["name"] = ts.name
		series.append(timeSerie)

	data = {"timeSeries":series};
	return HttpResponse(json.dumps(data), content_type='application/json')



def entries(request,timeserie_id):
	timeserie_id = int(timeserie_id);
	objects = Entry.objects.filter(timeSeries = timeserie_id).order_by('year','month');
	x = []
	y = []
	
	for e in objects:
		y.append(e.value);
		year = e.year;
		month = e.month;
		date_string = str(year) + "-" + str(month);
		x.append(date_string);

	data = {"entries":{"x":x,"y":y}}
	return HttpResponse(json.dumps(data), content_type='application/json')
