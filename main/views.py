from django.http import HttpResponse,HttpResponseRedirect
from django.core.context_processors import csrf
from django.template import Context, loader
from django.shortcuts import render_to_response,render
from .forms import *
from .models import *
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required

def index(request):
	template = loader.get_template('pages/login.html')
	return HttpResponse(template.render('hola'))

def pages(request):
    template = loader.get_template('pages/index.html')
    return HttpResponse(template.render('hola'))

def tables(request):
    template = loader.get_template('pages/tables.html')
    return HttpResponse(template.render('hola'))

def forms(request):
    template = loader.get_template('pages/forms.html')
    return HttpResponse(template.render('hola'))

def flot(request):
    template = loader.get_template('pages/flot.html')
    return HttpResponse(template.render('hola'))

def morris(request):
    template = loader.get_template('pages/morris.html')
    return HttpResponse(template.render('hola'))

def panelswells(request):
    template = loader.get_template('pages/panels-wells.html')
    return HttpResponse(template.render('hola'))

def buttons(request):
    template = loader.get_template('pages/buttons.html')
    return HttpResponse(template.render('hola'))
    
def notifications(request):
    template = loader.get_template('pages/notifications.html')
    return HttpResponse(template.render('hola'))    
def typography(request):
    template = loader.get_template('pages/typography.html')
    return HttpResponse(template.render('hola'))   
def icons(request):
    template = loader.get_template('pages/icons.html')
    return HttpResponse(template.render('hola'))  
def grid(request):
    template = loader.get_template('pages/grid.html')
    return HttpResponse(template.render('hola'))
def blank(request):
    template = loader.get_template('pages/blank.html')
    return HttpResponse(template.render('hola'))



def thanks(request):
    template = loader.get_template('pages/blank.html')
    return HttpResponse(template.render('Gracias por su formulario'))
    
@login_required
def estacion(request):
    station_list = Estacione.objects.all()
    po_list = PO.objects.all()
    contratista_list = Contratista.objects.all()
    return render_to_response(
        'estacion.html',
        {'station_list': station_list,'po_list': po_list,'contratista_list': contratista_list,}
    )

def get_name(request):
    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = ContactForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            subject = form.cleaned_data['subject']
            message = form.cleaned_data['message']
            sender = form.cleaned_data['sender']
            cc_myself = form.cleaned_data['cc_myself']
            recipients = ['info@example.com']
            if cc_myself:
                recipients.append(sender)

            send_mail(subject, message, sender, recipients)
            return HttpResponseRedirect('/thanks/')

    # if a GET (or any other method) we'll create a blank form
    else:
        form = ContactForm()

    return render(request, 'name.html', {'form': form})