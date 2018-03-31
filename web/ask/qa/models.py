from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse


# Create your models here.
class QuestionManager(models.Manager):
	def new(self):
		return self.order_by('-id')
	def popular(self):
		return self.order_by('-rating')

class AnswerManager(models.Manager):
	def all(self):
		return self.order_by('-question')
	def to_question(self, id):
		return self.filter(question__id=id)


class Question(models.Model):
	objects = QuestionManager()
	title = models.CharField(max_length=255)
	text = models.TextField()
	added_at = models.DateTimeField(blank=True, default=timezone.now)
	rating = models.IntegerField(default=0)
	author = models.ForeignKey(User, on_delete=models.DO_NOTHING)
	likes = models.ManyToManyField(User, related_name='question_like_user') #wtf?

class Answer(models.Model):
	objects = AnswerManager()
	text = models.TextField()
	added_at = models.DateTimeField(blank=True)
	question = models.ForeignKey(Question, on_delete=models.DO_NOTHING)
	author = models.ForeignKey(User, on_delete=models.DO_NOTHING)

class Tag(models.Model):
	slug = models.SlugField(unique=True)
	title = models.CharField(max_length=64)

	def get_url(self):
		return reverse('blog:tag-details', kwargs={'slug': self.slug})

	def __unicode__(self):
		return self.title

