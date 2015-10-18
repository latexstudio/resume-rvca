% Based on the original idea by Friggeri found at
% http://www.latextemplates.com/template/friggeri-resume-cv

\LoadClass[10pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rvca}[2014/05/04 RVCA CV class]

%% Options, full prints out full work items
\newcommand{\@full}{0}
\DeclareOption{full}{ 
  \renewcommand{\@full}{1}
}
\DeclareOption*{%
  \PackageWarning{rvca}{Unknown option `\CurrentOption'}%
}
\ProcessOptions\relax


%Class requirements
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{ifthen}


%%%
%%% Configuration 
%%%

%Color of links and header box
\definecolor{themecolor}{RGB}{255,145,0}
\definecolor{linkcolor}{RGB}{109,62,0}
% \definecolor{themecolor}{RGB}{0,102,204}




%%%
%%% General settings 
%%%



%Margin settings
\RequirePackage[left=6.1cm,top=2.0cm,right=1.2cm,bottom=1.2cm,nohead,nofoot]{geometry} 

%Hyperlinks
\RequirePackage[colorlinks = true,
            linkcolor = linkcolor,
            urlcolor  = linkcolor,
            citecolor = themecolor,
            anchorcolor = themecolor]{hyperref}
% Using verdana font
\renewcommand{\rmdefault}{pag}

% Remove page numbers
\pagestyle{empty} 

%%%
%%% Name Header
%%%

\newcommand{\header}[3]{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=themecolor, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {
      \fontsize{40pt}{72pt}\color{white}\selectfont #1 #2
      %\huge \color{white} #1 #2
    };
    \node [anchor=north] at (name.south) {
      \fontsize{14pt}{24pt}\color{white}\selectfont #3
      %\large \color{white} #3
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

%%%
%%% Aside Panel for contact info
%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large ##1}
  }
  \begin{textblock}{4.5}(1.0, 3.0)
  \begin{flushright}    
  \obeycr
}{
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%
%%% Statement Panel for a brief mision statement
%%%

\newenvironment{statement}{
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large ##1}
  }
  \begin{textblock}{14.3}(6.1, 3.8)
  \noindent
  \obeycr
}{
  \restorecr
  \end{textblock}
  \let\section\oldsection
}


%%%
%%% Sections and Subsections
%%%

\titleformat{\section}         % Customise the \section command 
{\Large\scshape\raggedright}   % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
{}{0em}                        % Can be used to give a prefix to all sections, like 'Section ...'
{}                             % Can be used to insert code before the heading
[\color{themecolor}\titlerule] % Inserts a horizontal line after the heading

%Subtitles  
\titleformat{\subsection}
{\large\scshape\raggedright}
{}{0em}
{}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}

%Subtitles
\titleformat{\subsection}
{\large\scshape\raggedright}
{}{0em}
{}

%Subsubtitles
\titleformat{\subsubsection}
{\normalsize\raggedright}
{}{0em}
{}



%%%
%%% Work Items
%%%

% \workitem
% {}%Company
% {}%Title
% {}%Dates
% {}%Responsibilities
% {}%Achievement(1)
% {}%Achievement(2)
% {}%Achievement(3)

% A Function that prints out:
% the first argument if empty, the second argument if it exists
\def\IfEmptyTF#1{%
  \if\relax\detokenize{#1}\relax
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi}

\newcommand{\workitem}[8]{
  \subsection[#1]{#1 \hfill #2}%
   \subsubsection {#3}%
  \ifthenelse{\@full=1}{%
    {\small #4}%
    {\small
     \begin{itemize}%
       \item #5%
       \IfEmptyTF{#6}{}{\item #6}%
       \IfEmptyTF{#7}{}{\item #7}%
       \IfEmptyTF{#8}{}{\item #8}%
     \end{itemize}
    }
  }{}%
}

\newcommand{\educationitem}[4]{
  \subsection[#1]{#1 \hfill #2}%
   \subsubsection {#3}%
  \ifthenelse{\@full=1}{%
    {\small #4}%
  }{}%
}


\newcommand{\achievements}[4]{
   \begin{itemize}%
       \item [\NinjaIcon] #1%
       \IfEmptyTF{#2}{}{\item [\NinjaIcon] #2}%
       \IfEmptyTF{#3}{}{\item [\NinjaIcon] #3}%
       \IfEmptyTF{#4}{}{\item [\NinjaIcon] #4}%
     \end{itemize}
}
%%%
%%% Images (power-ups like unicorns and ninjas, and QRCode)
%%%
\newcommand*{\HomeIcon}{\includegraphics[scale=0.05]{img/HomeIcon}}%
\newcommand*{\EmailIcon}{\includegraphics[scale=0.05]{img/EmailIcon}}%
\newcommand*{\TwitterIcon}{\includegraphics[scale=0.05]{img/TwitterIcon}}%
\newcommand*{\GithubIcon}{\includegraphics[scale=0.05]{img/GithubIcon}}%
\newcommand*{\LinkedinIcon}{\includegraphics[scale=0.05]{img/LinkedinIcon}}%

\newcommand*{\HeartIcon}{\includegraphics[scale=0.04]{img/HeartIcon}}%
\newcommand*{\UnicornIcon}{\includegraphics[scale=0.08]{img/UnicornIcon}}%
\newcommand*{\NinjaIcon}{\includegraphics[scale=0.3]{img/NinjaIcon}}

\newcommand*{\QrCode}{\includegraphics[scale=0.7]{img/qrcode}}
\newcommand*{\ghost}{\includegraphics[scale=1.0]{img/ghost}} %Empty image generating space