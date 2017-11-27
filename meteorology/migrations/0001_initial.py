# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Entry',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('value', models.FloatField()),
                ('year', models.IntegerField()),
                ('month', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Station',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('code', models.CharField(max_length=6)),
                ('name', models.CharField(max_length=30)),
                ('province', models.CharField(max_length=50)),
                ('longitude', models.FloatField()),
                ('latitude', models.FloatField()),
                ('elevation', models.FloatField()),
            ],
        ),
        migrations.CreateModel(
            name='TimeSerie',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Unit',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('representation', models.CharField(max_length=10)),
                ('description', models.CharField(max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='Variable',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30)),
                ('description', models.CharField(max_length=50)),
                ('station', models.ForeignKey(to='meteorology.Station')),
                ('unit', models.ForeignKey(to='meteorology.Unit', on_delete=django.db.models.deletion.PROTECT)),
            ],
        ),
        migrations.AddField(
            model_name='timeserie',
            name='variable',
            field=models.ForeignKey(to='meteorology.Variable'),
        ),
        migrations.AddField(
            model_name='entry',
            name='timeSeries',
            field=models.ForeignKey(to='meteorology.TimeSerie'),
        ),
    ]
