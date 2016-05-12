from django import forms
from django.db import models
from .models import *

class NameForm(forms.Form):
    your_name = forms.CharField(label='Your name', max_length=100)

class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.Textarea)
    sender = forms.EmailField()
    cc_myself = forms.BooleanField(required=False)
#----------------------------Combo Estaciones-------------
class EstacionesForm(forms.Form):
    estacion_dd = forms.ModelChoiceField(queryset=Estacione.objects.all().order_by('nombre'))	
    po_dd = forms.ModelChoiceField(queryset=PO.objects.all().order_by('cod_po'))	
    contratista_dd = forms.ModelChoiceField(queryset=Contratista.objects.all().order_by('nombre'))	

#---------------------------------------------------------------