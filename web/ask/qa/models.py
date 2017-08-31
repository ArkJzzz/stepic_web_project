from __future__ import unicode_literals

from django.db import models
from djago.contrib.auth.models import User

# Create your models here.

class Question(models.Model):
	title = models.CharField(max_lengt=255)
	text = models.TextField()
	added_at = models.DateTimeField(blank=True)
	rating = models.IntegerField(default=0)
	author = models.ForeignKey(User)
	likes = models.IntegerField(default=0)

class QuestionManager(models.Manager):
	"""менеджер модели Question"""
	# метод возвращающий последние добавленные вопросы
	def new(self):
		return self.order_by('-added_at')
    # метод возвращающий вопросы отсортированные по рейтингу 
	def popular(self):
		return self.order_by('-rating')

class Answer(models.Model):
	text = models.TextField()
	added_at = models.DateTimeField(blank=True)
	question = models.ForeignKey(Question)
	author = models.ForeignKey(User)



