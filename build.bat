@echo off

if "%1"=="" exit

masm %1.asm;
if errorlevel 1 exit

link %1.obj;