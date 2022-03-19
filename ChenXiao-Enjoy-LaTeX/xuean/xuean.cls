%设定所需系统的版本
\NeedsTeXFormat{LaTeX2e}
%设定类文件的名称
\ProvidesClass{jiangyi}
%加载ctexbook文类
\LoadClass{ctexbook}
%空心句号自动转化为实心点号
\defaultfontfeatures{Mapping=fullwidth-stop}
%思源字体标宋
\setCJKfamilyfont{zhbs}{Source Han Serif CN Bold}% 标song
\def\bs{\CJKfamily{zhbs}}
%开明标点制，全文宋体标点，数学模式直接输入中文，避免孤字成行
\xeCJKsetup{PunctStyle=kaiming,PunctFamily=zhsong,CJKmath,CheckSingle}
%设置英文字体
\setmainfont[BoldFont=Times New Roman-Bold,BoldItalicFont=Times New Roman-Bold Italic]{CMU Serif}
\setsansfont{Arial}
\setmonofont{CMU Typewriter Text}
%数学宏包
\RequirePackage{mathtools,amssymb,mathrsfs,empheq,scalerel,esvect,zhmathstyle,mathsymbolzhcn}
%数学字体尺寸
\DeclareMathSizes{10.5bp}{10.5bp}{6.8pt}{6pt}
%页面设置
  \RequirePackage{geometry}
   \geometry{paperheight=29.7cm,
    paperwidth=21cm,
    width=17cm,
    height=25.7cm,
    left=1.8cm,
    right=1.6cm,
    top=1.5cm,
    bottom=2.5cm,
    headsep=3.2em,
    marginparsep=-13.5em,
    marginparwidth=13em,
    reversemarginpar}
%边注设置
   \usepackage[noadjust]{marginnote}
   \usepackage{zhbianzhu}
   \renewcommand*{\raggedleftmarginnote}{}
   \renewcommand*{\raggedrightmarginnote}{}
   \renewcommand*{\marginfont}{\CTEXindent\kaishu}
  %不对称分栏设置
   \RequirePackage{paracol}
   \columnratio{0.3}
   \setlength{\columnsep}{0.5em}
   \setlength{\columnseprule}{0em}
   \footnotelayout{m}
   %插图设置
   \RequirePackage{graphicx}
   %带圈数字宏包
   \RequirePackage{zhshuzi}
   %颜色宏包
   \RequirePackage{xcolor}
   %绘图宏包
  \RequirePackage{tikz,tikzpagenodes}
   %彩框宏包
   \RequirePackage[most]{tcolorbox}
  
   %批注框
   \newtcolorbox{pizhu}{parbox=false,before upper=\indent,
   	drop fuzzy shadow,enhanced,
   	boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
   	colback=gray!5,
   	colframe=black,
   	sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
   	overlay={
   		\path[fill=gray!20] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
   		\path[draw=black,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
   		\path[fill=gray,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
   }}
   %习题框
   \usetikzlibrary{decorations.markings}
   \newtcolorbox{XiTi}{enhanced,breakable,sharp corners=all,left=1mm,width=\textwidth-7mm,before skip=1.5em,colframe=black,colback=gray!5,
   	attach boxed title to top left={xshift=0mm,
   		yshift=0mm},boxed title style={skin=enhancedfirst jigsaw,arc=5mm,bottom=0mm,
   		left=8mm,right=18mm,top=1mm,colback=black,colframe=black},borderline north={4pt}{-4pt}{black},
   	title={习题 \thesection},	fonttitle=\bf\Large,parbox=false,before upper=\indent,
   	overlay={
   		\fill[
   		decorate,
   		decoration={
   			markings,
   			mark = between positions 0.05 and 0.98 step 6mm with{%
   				\node[circle,draw=black]{};
   			}
   		}]([xshift=3mm,yshift=-6mm]frame.north east)--([xshift=3mm,yshift=5mm]frame.south east);
   		\draw[thick,rounded corners]([yshift=-2mm]frame.north east)--++(0:6mm)--([xshift=6mm,yshift=2mm]frame.south east)--++(180:6mm);
   		\begin{tcbclipinterior}
   			\fill[gray!60](frame.north west) rectangle ([xshift=1cm]frame.south west);
   		\end{tcbclipinterior}
   	},
   }
   %%%列表环境
  \RequirePackage{enumitem}
   \setenumerate{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
   %对位环境
    \RequirePackage{hlist}
   \newenvironment{xx}[5][4]{
   	\begin{hlist}[pre skip=0pt,post skip=0pt,label=\Alpha{hlisti}.,pre label=,item offset=1.2em,col sep=0.5em]#1
   		\hitem #2 \hitem #3 \hitem #4 \hitem #5
   	}{\end{hlist}}
   \newenvironment{tg}[5][4]{
   	\begin{hlist}[pre skip=0pt,post skip=0pt,show label= false,pre label=,item offset=1.2em,col sep=0.5em]#1
   		\hitem #2 \hitem #3 \hitem #4 \hitem #5
   	}{\end{hlist}}
   %习题环境
   \tcbset{biaoqian/.style={on line,top=0mm,bottom=0mm,arc=0mm,boxrule=0mm,
   		colback=gray!5,fontupper=\bf,left=0mm,right=0mm}}
   \newenvironment{xiti}{
   	\begin{enumerate}[label={\tcbox[biaoqian]{\makebox[2em]{\arabic*}}},
   		labelindent=0em,
   		labelwidth=2em,labelsep=0.2em,leftmargin=2.2em]}{\end{enumerate}}
   	%例题环境
   		\RequirePackage{fontawesome}
   	\newcounter{lt}[section]
   	\newenvironment{liti}{\refstepcounter{lt}
   		\begin{enumerate}[align=left,labelindent=0mm,label={\bf\faCogs 例\hfquan{\thelt}},labelwidth=3.8em,labelsep=0mm,leftmargin=3.8em]
   			\item 
   		}{\end{enumerate}}
   	%解析环境
   	\newenvironment{jiexi}[1][解析]{\faWifi{\bf #1}\hspace{0.5em}}{\par}
   	%章节标题设计
   	\RequirePackage[explicit,indentafter,pagestyles]{titlesec}	
   		\titleformat{\chapter}
   	[display]
   	{\bs\LARGE\filleft}
   	{\CTEXthechapter}{0.2em}
   	{\titlerule[2pt]\centering\vspace{0.4em} #1}
   	[]
   	\titleformat{name=\chapter,numberless}
   	{\LARGE}
   	{}
   	{0em}
   	{\bs\filleft #1}
   	[{\titlerule[2pt]}]
   	
   	\titleformat{\section}
   	{\bf\Large}
   	{}
   	{0em}
   	{\begin{tcolorbox}[nobeforeafter,enhanced,sidebyside,bicolor,colback=black,colbacklower=gray!30,colupper=white,collower=black,halign upper=center,halign lower=left,lefthand width=2cm,arc=0mm,boxrule=0mm,top=1mm,bottom=1mm]
   			\thesection	\tcblower #1
   		\end{tcolorbox}
   	}
   	[]
   	\titlespacing*{\section}{0em}{0em}{-2em}
   	\titlespacing*{\subsection}{-3.5em}{0em}{0.5em}
   	%页脚设计
   	\newpagestyle{yejiao}{
   		\setfoot[初高中衔接教材~\rule[-0.4mm]{0.2em}{1em}~\thepage][][]
   		{}{}{\ifthechapter{\thepage~\rule[-0.4mm]{0.2em}{1em}~\CTEXthechapter\quad\chaptertitle}{\thepage~\rule[-0.4mm]{0.2em}{1em}~\chaptertitle}}
   	}
   	\pagestyle{yejiao}
   	\renewpagestyle{plain}{
   		\setfoot[][][]{}{}{\ifthechapter{\thepage~\rule[-0.4mm]{0.2em}{1em}~\CTEXthechapter\quad\chaptertitle}{\thepage~\rule[-0.4mm]{0.2em}{1em}~\chaptertitle}}
   	}
    %填空题横线
   \newcommand{\tk}{\CJKunderline{\hspace*{1.6em}$\blacktriangle$\hspace*{1.6em}}}
   %表格宏包
   \RequirePackage{array,multirow,makecell,booktabs,hhline,colortbl}
   \setlength{\abovetopsep}{0ex} \setlength{\belowrulesep}{0ex}
   \setlength{\aboverulesep}{0ex} \setlength{\belowbottomsep}{0ex}
   \newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
   \newcolumntype{Y}{!{\vrule width 0.08em}}
   %数学行距
   \lineskiplimit=5pt
   \lineskip=6pt
   \delimiterfactor=800
   %数学公式框
   \newtcbox{\eqmybox}{on line,colback=white,colframe=black,top=1mm,bottom=0mm,left=0mm,
   	right=0mm,arc=3mm,boxrule=0pt,colback=gray!30}
   %目录宏包
   \RequirePackage[titles]{tocloft}
   \renewcommand{\cftdot}{\LARGE$\cdot$}
   \renewcommand{\cftdotsep}{0.7}
   \renewcommand{\cftchapdotsep}{\cftdotsep}
   %分栏目录
   \RequirePackage{multicol}
   \renewcommand\cfttocprehook{\begin{multicols}{2}}
    \renewcommand\cfttocposthook{\end{multicols}}
	%行距
	\usepackage[bodytextleadingratio=1.5,restoremathleading=true]{zhlineskip}
	 \SetMathEnvironmentSinglespace{1.1}
%数学环境下使用中文冒号
\AtBeginDocument{
	\begingroup
	\catcode `\:=\active
	\scantokens{\gdef:{\mathpunct{\mbox{：\hspace{-0.18em}}}}}
	\endgroup
	\mathcode`\:="8000
}
%数学环境下使用中文逗号

\makeatletter
\begingroup
\catcode`\,=\active
\def\@x@{\def,{\mathpunct{\mbox{，\hspace{-0.18em}}}}}
%\def\@x@{\def,{{\mbox{，}}}}
\expandafter\endgroup\@x@
\mathcode`\,="8000
\makeatother
%数学环境下使用中文分号
\AtBeginDocument{
	\begingroup
	\catcode `\;=\active
	\scantokens{\gdef;{\mathpunct{\mbox{；\hspace{-0.18em}}}}}
	\endgroup
	\mathcode`\;="8000
}
\endinput
