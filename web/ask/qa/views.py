# -*- coding: utf-8 -*-

from django.http import HttpResponse, Http404
from django.shortcuts import render, get_object_or_404
from django.views.decorators.http import require_GET
from .models import Question


# Create your views here.

def test(request):

	return HttpResponse('OK')


#URL = /?page=2

def index(request):
	try:
		page = request.GET.get('page')
	except Question.DoesNotExist:
		raise Http404
	return HttpResponse('Главная страница. Список "новых" вопросов.')





def popular(request):
	return HttpResponse('Cписок "популярных" вопросов.')

def question(request, question_id):
	question = get_object_or_404(Question, pk=question_id)
	return render(request, 'qa/question.html', {
		'question': question,
		})



###################################################

def post_details(request, slug):
	post = get_object_or_404(Post, slug=slug)
	return render(request, 'blog/post_details.html', {
		'post':		post,
		})

@require_GET
def post_details(request, slug):
	post = get_object_or_404(Post, slug=slug)
	try:
		vote = post.votes.filter(user=request.user)[0]
	except Vote.DoesNotExist:
		vote = None
	return render(request, 'blog/post_details.html', {
		'post':		post,
		'category':	post.category,
		'tags':		post.tags.all()[:],
		'vote':		vote,
		})

def post_list_all(request):
	posts = Post.objects.filter(is_published=True)
	limit = request.GET.get('limit', 10)
	page = request.GET.get('page', 1)
	paginator = Paginator(posts, limit)
	paginator.baseurl = '/blog/all_posts/?page='
	page = paginator.page(page) #Page
	return render(request, 'blog/post_by_tag.html', {
		posts:		page.object_list,
		paginator:	paginator,
		page:		page,
		})

def post_list_main(request):
	since = request.GET.get('since')
	post = Post.objects.main(since)
	return render(request, 'blog/post_main.html', {
		posts:	post,
		since:	post[-1].id,
		})