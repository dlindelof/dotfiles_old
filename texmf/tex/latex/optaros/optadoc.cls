%%
%% Optaros document class
%% Tested with TeX Live and DviPDFm, YMMV
%% Output resembles Optaros Office template, with the following
%% (intentional) changes:
%%  * Type 1 font instead of Microsoft Verdana
%%  * Uses vector graphics for Optaros graphical elements
%% 
%% Known limitations:
%%  * it may break with very long titles
%%  * only useful for A4 paper
%%  * only PDF output is supported
%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{optadoc}
              [2005/09/16 v1.4f
 Standard LaTeX document class]

\DeclareOption{a5paper}
    {\ClassError{proc}{Option `a5paper' not supported}{}}
\DeclareOption{b5paper}
    {\ClassError{proc}{Option `b5paper' not supported}{}}
\DeclareOption{letterpaper}
    {\ClassError{proc}{Option `letterpaper' not supported yet}{}}
\DeclareOption{legalpaper}
    {\ClassError{proc}{Option `legalpaper' not supported}{}}
\DeclareOption{executivepaper}
    {\ClassError{proc}{Option `executivepaper' not supported}{}}
\DeclareOption{landscape}
    {\ClassError{proc}{Option `landscape' not supported}{}}

\PassOptionsToClass{a4paper}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}


\RequirePackage{url}
\RequirePackage{epsfig}
\RequirePackage{fancyhdr}
\RequirePackage[plain]{fullpage}

\RequirePackage{pifont}
\RequirePackage{lastpage}

\RequirePackage[dvipdfm, bookmarks=true,%
  bookmarkstype=toc,%
  colorlinks=true,%
  bookmarksnumbered,%
  pdfstartview={FitH},%
  citecolor={black},%
  linkcolor={black},%
  urlcolor={black},%
  pdfpagemode={UseOutlines}%
]{hyperref}

\renewcommand{\familydefault}{cmss}
\renewcommand{\figurename}{\sf{Figure}\sf}

\def\email#1{\hyper@linkurl{\Hurl{<#1>}}{mailto:#1}}

\newlength\titlebackgroundbottomx
\newlength\titlebackgroundbottomy

\setlength\titlebackgroundbottomx{30.7mm}
\setlength\titlebackgroundbottomy{19.8cm}

\renewcommand\maketitle{\begin{titlepage}%
\epsfig{file=Optaros_title_page_top.eps, bbllx=3.1cm, bblly=3.1cm}%
\vskip 4.1cm%
\begin{center}%
\begin{tabular}{lc}%
\begin{minipage}[c]{6.2cm}%
\epsfig{file=OptarosTM_logo_process.eps, height=15mm}
\end{minipage}%
&%
\begin{minipage}[c]{9.5cm}%
\begin{center}%
  {\LARGE \@title \par}%
  \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
\end{center}%
\end{minipage}%
\end{tabular}%
\end{center}%

\epsfig{file=Optaros_title_page_bottom.eps, bbllx=\titlebackgroundbottomx, bblly=\titlebackgroundbottomy}%
\end{titlepage}%
}

\def\pdftitle#1{\hypersetup{pdftitle={#1}}}
\def\pdfauthor#1{\hypersetup{pdfauthor={#1}}}
\def\pdfsubject#1{\hypersetup{pdfsubject={#1}}}
\def\pdfkeywords#1{\hypersetup{pdfkeywords={#1}}}

\newcommand\pdftitlefromtitle{\pdftitle \@title}
\newcommand\pdfauthorfromauthor{\setpdfauthor \@author}
\newcommand\pdfpropertiesfromdoc{
  \pdftitlefromtitle
  \pdfauthorfromauthor
}

\newcommand\mainpagestyle{
\pagestyle{fancyplain}%
\headheight 20pt%
\headsep 0.5cm%
\lhead{\begin{minipage}[c]{3cm}%
\epsfig{file=OptarosTM_logo_process.eps, height=7mm}%
\end{minipage}}%
\rhead{\@title}%
\chead{}%
\lfoot{\Pisymbol{psy}{211} Copyright {\number\year} Optaros, confidential}%
\cfoot{}%
\rfoot{{\thepage}~/~{\pageref{LastPage}}}%
}
