#!/bin/bash
cd code && python run.py;
cd ../latex && pdflatex report.tex &&  bibtex report && makeglossaries report && pdflatex report;
cp report.pdf ../report/;
