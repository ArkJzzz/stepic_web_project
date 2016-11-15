
def wsgi_application(environ, start_response):
    status = "200 OK"
    response_headers = [('Content-type','text/plain')]
    body = ""
    for line in environ["QUERY_STRING"].split("&"):
    	body = body + line + "\n"
    start_response(status, response_headers)
    return [body]