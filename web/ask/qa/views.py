# -*- coding: utf-8 -*-

from django.http import HttpResponse, Http404
from django.shortcuts import render, get_object_or_404
from django.views.decorators.http import require_GET
from django.contrib.auth.models import User
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .models import Question, Answer


# Create your views here.

def test(request):
	return HttpResponse('OK')

#URL = /qa/question/1
def question(request, question_id):
	question = get_object_or_404(Question, id=question_id)
	answers = Answer.objects.to_question(id=question_id)
	return render(request, 'qa/question.html', {
		'question': question,
		'answers' : answers,
		})


@require_GET
#URL = /?page=2
def index(request):
	question_list=Question.objects.new()

	paginator = Paginator(question_list, 10)
	page = request.GET.get('page')

	try:
		questions = paginator.page(page)
	except PageNotAnInteger:
		questions = paginator.page(1)
	except EmptyPage:
		questions = paginator.page(paginator.num_pages)

#	limit = request.GET.get('limit', 10)
#	page = request.GET.get('page', 1)
#	paginator = Paginator(questions, limit)
#	paginator.baseurl = '/?page='
#	page = paginator.page(page) #Page

	return render(request, 'qa/index.html', {
		'questions': questions,
		'paginator': paginator,
		'page': page,
		})


#URL = /popular/?page=2
def popular(request):
	question_list=Question.objects.popular()

	paginator = Paginator(question_list, 10)
	page = request.GET.get('page')

	try:
		questions = paginator.page(page)
	except PageNotAnInteger:
		questions = paginator.page(1)
	except EmptyPage:
		questions = paginator.page(paginator.num_pages)

#	limit = request.GET.get('limit', 10)
#	page = request.GET.get('page', 1)
#	paginator = Paginator(questions, limit)
#	paginator.baseurl = '/?page='
#	page = paginator.page(page) #Page

	return render(request, 'qa/popular.html', {
		'questions': questions,
		'paginator': paginator,
		'page': page,
		})


###################################################



#@require_GET
#def post_details(request, slug):
#	post = get_object_or_404(Post, slug=slug)
#	try:
#		vote = post.votes.filter(user=request.user)[0]
#	except Vote.DoesNotExist:
#		vote = None
#	return render(request, 'blog/post_details.html', {
#		'post':		post,
#		'category':	post.category,
#		'tags':		post.tags.all()[:],
#		'vote':		vote,
#		})
#
#def post_list_all(request):
#	posts = Post.objects.filter(is_published=True)
#	limit = request.GET.get('limit', 10)
#	page = request.GET.get('page', 1)
#	paginator = Paginator(posts, limit)
#	paginator.baseurl = '/blog/all_posts/?page='
#	page = paginator.page(page) #Page
#	return render(request, 'blog/post_by_tag.html', {
#		posts:		page.object_list,
#		paginator:	paginator,
#		page:		page,
#		})
