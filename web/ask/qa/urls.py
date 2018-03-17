# -*- coding: utf-8 -*-

"""ask URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
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
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^test/$', views.test, name = 'test'), 					#URL = qa/test
    url(r'^$', views.index, name='index'), 							#URL = qa/?page=2
    url(r'^popular/$', views.popular, name='popular'), 				#URL = qa/popular/?page=3
    url(r'^question/(\d+)/$', views.question, name='question'), 	#URL = qa/question/5/
]


#urlpatterns = [
#	url(r'^post/(?P<slug>\w+)/$', post_details, name='post_details'), #URL = /post/about_me/
#	url(r'^tag/^(?P<slug>\w+)/$', tag_details, name='tag_details'), #URL = /tag/pisanina
#]


