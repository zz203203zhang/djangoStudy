from django.http import HttpResponse


def show_views(request):
    # return一个响应对象
    return HttpResponse("我的第一个Django程序")


def show1_views(request, pageNumber):
    return HttpResponse("访问的页码为：" + pageNumber)
