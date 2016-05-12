"""SGT URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import patterns, include, url
from django.contrib import admin
from main import views
admin.autodiscover()

urlpatterns = [
    url(r'^admin/', admin.site.urls),
      url(r'^$', views.index, name='index'),
      url(r'^main/', include('main.urls')),
      url(r'^pages/', views.pages, name='pages'),
      url(r'^tables/', views.tables, name='tables'),
      url(r'^forms/', views.forms, name='forms'),
      url(r'^flot/', views.flot, name='flot'),
      url(r'^morris/', views.morris, name='morris'),
      url(r'^panels-wells/', views.panelswells, name='panels-wells'),
      url(r'^buttons/', views.buttons, name='buttons'),
      url(r'^notifications/', views.notifications, name='notifications'),
      url(r'^typography/', views.typography, name='typography'),
      url(r'^icons/', views.icons, name='icons'),
      url(r'^grid/', views.grid, name='grid'),
      url(r'^blank/', views.blank, name='blank'),
      url(r'^get_name/', views.get_name, name='get_name'),
      url(r'^thanks/', views.thanks, name='thanks'),
      url (r'^estacion/$', views.estacion),
     
]


