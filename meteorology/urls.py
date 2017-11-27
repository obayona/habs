from django.conf.urls import url
from . import views

#urlpatterns = patterns('geonode.meteorology.views',url(r'^$','index',name='index'),)
urlpatterns = [
	url(r'^$',views.index,name='index'),
	url(r'^stations/',views.stations,name='stations'),
	url(r'^station/([0-9]+)',views.station,name='station'),
	url(r'^variables/([0-9]+)',views.variables,name='variables'),
	url(r'^timeseries/([0-9]+)',views.timeSeries,name='timeseries'),
	url(r'^entries/([0-9]+)',views.entries,name='entries')
]

