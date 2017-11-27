from django.conf.urls import url
from . import views

#urlpatterns = patterns('geonode.meteorology.views',url(r'^$','index',name='index'),)
urlpatterns = [
	url(r'^$',views.index,name='index'),
	url(r'^stations/',views.stations,name='stations'),
	url(r'^station/([0-9]+)',views.station,name='station'),
	url(r'^timeseries/([0-9]+)',views.timeSeries,name='timeseries')
]

