from django.contrib import admin
from .models import Machine

@admin.register(Machine)
class MachineRegister(admin.ModelAdmin):
    pass
