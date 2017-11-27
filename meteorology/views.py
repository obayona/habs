import json, requests
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.core import serializers
from django.template import RequestContext
from models import Station,Unit,TimeSerie,Entry

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


def timeSeries(request,station_id):
	station_id = int(station_id);
	timeSeries = TimeSerie.objects.filter(station_id = station_id);
	series = []
	for ts in timeSeries:
		timeSerie = {}
		timeSerie["description"] = ts.description
		timeSerie["variable"] = ts.variable
		timeSerie["unit_representation"] = ts.unit.representation
		timeSerie["unit_description"] = ts.unit.description
		timeSerie["pk"] = ts.pk
		series.append(timeSerie)

	return HttpResponse(json.dumps(series), content_type='application/json')




