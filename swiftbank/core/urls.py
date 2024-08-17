from django.contrib import admin
from django.http import HttpResponse, JsonResponse
from django.urls import path


def health_check(request):
    return JsonResponse({'status': 'ok'})


def aneeta_view(request):
    return HttpResponse('Hii bubeee')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('ping/', health_check),
    path('aneeta/', aneeta_view),
]
