% file : espaceReport.cls
% Provides template for eSpace reports
%----------------------------------------
% Declare Class
%----------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{SkoltechReport}[2015/09/14]

%---- eSpaceReport is an extension of article class ----%
\LoadClass[12pt,onecolumn,a4paper,twoside,openright,final]{article}

%----------------------------------------
% Specific informations
%----------------------------------------
%\newcommand\projectPhase[1]{\def\@projectPhase{#1}}
\newcommand\projectName[1]{\def\@projectName{#1}}
%\newcommand\subtitle[1]{\def\@subtitle{#1}}
\newcommand\projectType[1]{\def\@projectType{#1}}
%\newcommand\revisionNum[1]{\def\@revisionNum{#1}}
\newcommand\approvedBy[1]{\def\@approvedBy{#1}}
\newcommand\checkedBy[1]{\def\@checkedBy{#1}}

%---- Packages ----%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{afterpage}
\usepackage{fancyhdr}
\usepackage[unicode=true, colorlinks=true, linkcolor=black]{hyperref}
\usepackage[bottom=2.75cm,left=2.75cm,right=2.75cm,head=1cm]{geometry}
\usepackage{multicol}
\usepackage{array}
\usepackage{palatino}
\usepackage{float}
\usepackage{times}
\usepackage{booktabs}
\usepackage[pdftex]{graphicx}
\usepackage{url}
\usepackage{eurosym}
\usepackage{mathtools}
\usepackage{amsmath,amssymb,amsfonts}
\usepackage{multirow}
\usepackage{gensymb}
%\usepackage{color}
%\usepackage{colortbl}
\usepackage[table,xcdraw]{xcolor}
\usepackage{lastpage}
\usepackage{listings}
\usepackage[absolute]{textpos}
\usepackage{rotating}
\usepackage[ddmmyyyy]{datetime}
\usepackage{graphicx}
\usepackage{wrapfig}
\usepackage{chngcntr}
\usepackage{wrapfig}
\usepackage{subcaption}
\usepackage{background}
\usetikzlibrary{calc}
\usepackage{parskip}
\usepackage[backend=bibtex, style=trad-abbrv, sorting=nty, defernumbers=true, url=true, isbn=false]{biblatex}
\setlength{\bibitemsep}{\baselineskip}
\usepackage{csquotes}
\usepackage{verbatim}
\usepackage{epstopdf}
\usepackage[final]{pdfpages}
\usepackage{longtable}
\usepackage[acronym]{glossaries}

%---- Set automatic path for figures ----%
\graphicspath{{fig/}{../fig/}}

%---- Spacing between paragraphs ----%
\setlength{\parskip}{5pt plus 1pt minus 1pt}


%---- Figure at the exact place ----%
%---- Example : \figi{filename}{label}{Légende de la figure}{Largeur (par ex: 0.6\linewidth)}
\newcommand{\figi}[4]{
   \begin{figure}[!ht]
   \begin{center}
   \includegraphics[width=#4]{#1}
   \end{center}
   \caption{\label{#2}#3}
   \end{figure}
}

%---- Figure numbering changes -----%
\numberwithin{figure}{section}

%---- Provide correct unit notation ----%
\providecommand{\unit}[1]{\, \mathrm{#1}}


% Get rid of the annoying warning message. 
\setlength{\headheight}{52pt} 
\setlength{\textheight}{660pt} 

%---- Define the headers and footers ----%
\setlength{\headwidth}{\textwidth}
\fancyhead[LO,RE]{\includegraphics[width=2cm]{logos/logo_Skoltech}}
\setlength{\headsep}{15mm}
\fancyhead[LE,RO]{%
    \begin{tabular}{lr}
        % Issue:&1 \hfill Rev: \@revisionNum\\                    %ISSUE AND REVIEW
        Date:&\today \\
        Page:&\thepage \hspace{1mm}of \pageref{LastPage} \\
    \end{tabular}}
\fancyfoot[RO,LE]{\small\textsc{\@projectName}}
\fancyfoot[C]{}
\pagestyle{fancy}


%---- Draw the black border around the pages ----%
\backgroundsetup{color=black,scale=1,opacity=1,angle=0,contents={\tikz\draw[line width=1pt,black]
  ( $ (current page.south east) + (-1.5,0.75) $ ) rectangle ( $ (current page.north west) + (1.5,-1) $ );}
}

%---- No border on titlepage ----%
\newcommand{\nocolourframe}{%
  \clearpage \backgroundsetup{ contents={}} \pagestyle{empty}
}

% ---- Make title page ----%
\renewcommand\@maketitle{
    \nocolourframe \pagenumbering{gobble} \columnseprule=0.4pt
    \begin{multicols}{2}

    %left column
    {   \includegraphics[width=4cm]{logos/logo_Skoltech}
        \vspace*{0.5\textwidth}
        \hrule \vspace{2mm} Prepared by:\vspace{4mm}\\ \textsc{\@author} \vspace{16mm}
        \hrule \vspace{2mm} Checked by:\vspace{4mm}\\ \textsc{\@checkedBy} \vspace{16mm}
        \hrule \vspace{2mm} Approved by:\vspace{4mm}\\ \textsc{\@approvedBy} \vspace{16mm}
        \hrule \vspace{10mm} \begin{center} Space Center\\ Skoltech\\ Moscow, Russia\\ $\bullet$\\ \today\\ \end{center}
    }
    %right column
    {   \columnbreak{ 
          %\Large \textbf{\@projectPhase}
        } %\vspace{12mm}\\
        \Large{ \textbf{\@projectName}} \vspace{8mm} \\
        %\Large{\@subtitle}  
        %\vspace{6mm}\\
        %\large{ Rev: \@revisionNum} 
        \vspace{6mm}\\
        \large{ \@projectType} \vspace{20mm}\\
        \hfill\includegraphics[width=7cm]{logos/planet_Logo}
        \vfill
        \hfill\includegraphics[width=4cm]{logos/SkoltechSpace_logo}
    }
    \end{multicols}
    \clearpage
}

% %---- Make record of revisions and add line to toc ----%
% \newcommand{\makerecordofrevision}{
%   \thispagestyle{fancy}
%   \addcontentsline{toc}{section}{Record of revisions}
%   \input{chap/recordofrevisions}
%   \clearpage
% }

% %---- Make list of tables and add entry to toc ----%
% \newcommand{\makelistoftables}{
%   \addcontentsline{toc}{section}{List of Tables}
%   \listoftables
%   \clearpage
% }

%---- Make list of figures and add entry to toc ----%
\newcommand{\makelistoffigures}{
  \addcontentsline{toc}{section}{List of Figures}
  \listoffigures
  \clearpage
}

% %---- Print abbreviations ----%
% \newcommand{\makeabbreviations}{
%   \input{chap/abbreviations}
%   % \clearpage
% }

%---- Redefine spacing between entry in the bibliography ----%
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
 \oldbibliography{#1}%
 \setlength{\itemsep}{8pt}%
}

%---- Redefine color and style of url in the bibliography ----%
\def\url@standardstyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\color{blue}\small\ttfamily}}}
\urlstyle{standard}


%---- Print the bibliography ----%
\newcommand{\makebibliography}{
  % \clearpage
  \nocite{*}
  \addcontentsline{toc}{section}{References}
  \printbibliography%[prefixnumbers={RD}]
  \clearpage
}