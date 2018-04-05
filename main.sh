# !/ bin / bach
if [ $# -gt 0 ] && [ $# -lt 5 ]; then #test si le nombre d'arguments est comprit entre 1 et 5
if [ "$1" = "-GPL" ] || ["$1" = "-MIT" ] || [ "$1" = "-Git" ] || [ "$1" = "-C"] || [ "$1" = "-Cpp" ] || [ "$1" = "-Latex" ] || [ "$1" = "-C++" ] || [ "$1" = "-Py"]; then echo "Erreur: l'argument 1 doit avoir le nom du projet"
else if [ $# -eq 0 ]; then #test si le nombre d'arguments est égal à 0, si vrai on retourne Erreur
echo "Expected arguments, please check the help: initdev -help"
elif [ $# -eq 1 ]; then #vérifier si le nombre d'arguments est égal à 1

if [ "$1" = "-Name" ]; then #la commande -Name sera ajoutée
echo "Nom de l'application: initdev" ;
echo "Fonctionnalité: cette application permet d'initialiser un dépot git et d'ajouter un fichier gitignore, makefile, licence et choisir une langue"
elif [ "$1" = "-help" ]; then #la commande -help sera ajoutée
echo "Arguments: "
echo "-Name: afficher le nom de l'application et sa fonctionnalité"
echo "-Syntax: afficher la syntaxe de la commande initdev"
echo "-Args: classer les arguments et attribuer une description de chacun"
echo "-author: afficher le nom et l'adresse mail de l'auteur de l'application"
elif [ "$1" = "-Syntax" ]; then #la commande -Syntax sera ajoutée
echo "Conditions d'utilisation:
1)pour créer un projet, le nom de ce dernier doit etre le premier argument dans toutes les syntaxes.
2)la répétition d'un meme argument dans la meme commande est impossible
3)vous pouvez créer un projet sans sans citer la licence et le langage
4)vous pouvez créer un projet avec une licence de votre chois sans préciser le langage
5)vous pouvez créer un projet avec un langage et une licence précis 
6)vous pouvez créer un projet avec un depot git en indiquant le langage utilisé
7)vous pouvez créer un projet avec un langage précis, une licence et depot initiale git"
elif [ "$1" = "-args" ]; then #la commande -args sera ajoutée
echo "Arguments:
veut dire que cette argument est unique
-Name	:	affiche le nom de l'application
-help	:	affiche l'aide
-syntax	:	affiche les syntaxes d'utilisation
-author	:	affiche le nom et l'adresse mail de l'auteur de l'application
-args	:	affiche les arrguments de l'application
-C	:	le projet est en langage C 
-C++ ou Cpp:	le projet est en langage C++
-Py	:	le projet est en langage Python
-Latex	:	le projet est rédigé en Latex
-Beamer	:	le projet est rédigé en Beamer
-GPL	:	le projet est avec une licence GENERAL PUBLIC LICENCE
-MIT	:	le projet est avec une licence MIT
-Git	:	un fichier gitignore et un depot git seront ajoutés dans le répertoire du projet"
	elif [ "$1" = "-author" ]; then #la commande -author sera ajoutée
echo "Author: BENNANNI Farah Sarah"
echo "Adresse mail: farah.s.ben@gmail.com"
else #création d'un projet sans licence ou langage précis
mkdir "$1"
touch "$1"/main
touch "$1"/licence
touch "$1"/makefile


else
	if [ $# -eq 2 ]; then #vérifier si le nombre d'arguments est égal à 2
		if [ "$2" = "-C" ]; then #creation d'un projet avec le langage C sans licence précise
		mkdir "$1" 
		cp /home/"$user"/.initdev/sources/main.c "$1"/
		touch "$1"/Licence ;
		touch "$1"/makefiles ;
		
		elif [ "$2" = "-C++" ] || ["$2" = "Cpp" ]; then #creation d'un projet avec le langage C++ sans licence précise		
		mkdir "$1"
		cp /home/"$user"/.initdev/sources/main.cpp "$1"/
		touch "$1"/Licence ;
		touch "$1"/makefiles ;
		
		elif [ "$2" = "-Py" ]; then #creation d'un projet avec le langage Python sans licence précise		
		mkdir "$1"
		cp /home/"$user"/.initdev/sources/main.Py "$1"/
		touch "$1"/Licence ;
		touch "$1"/makefiles ;

		elif [ "$2" = "-Latex" ]; then #création d'un projet rédigé en Latex sans licence pricise
		mkdir "$1"
		cp /home/"$user"/.initdev/sources/latexMin.tex "$1"/
		mv "$1"/latexMin.tex "$1"/main.tex
		touch "$1"/Licence ;
		touch "$1"/makefiles ;		
		
		elif [ "$2" = "-Beamer" ]; then #création d'un projet rédigé en Beamer sans licence précise
		mkdir "$1"
		cp /home/"$user"/.initdev/sources/beamer.tex "$1"/
		mv "$1"/beamer.tex "$1"/main.tex
		touch "$1"/Licence ;
		touch "$1"/makefiles ;		

		elif [ "$2" = "-GPL"]; then #création d'un projet avec une licence GPL sans langage précis
		mkdir "$1" 
		touch "$1"/main ;
		cp /home/"$user"/.initdev/licences/GPL "$1"/
		mv "$1"/GPL "$1"/licence
		touch "$1"/makefile;
		
		elif ["$2" = "-MIT" ]; then ##création d'un projet avec une licence MIT sans langage précis
		mkdir "$1" 
		touch "$1"/main ;
		cp /home/"$user"/.initdev/licences/MIT "$1"/
		mv "$1"/MIT "$1"/licence
		touch "$1"/makefile;
 	fi
elif [ $# -eq 3 ]; then #vérifier si le nombre d'arguments est égal à 3
#les commandes suivantes réarrange les arguments
arg2 = "$2"
arg3 $ "$3" 
	if [ "$2" = "$3"]; then echo "interdiction de répéter les arguments"
		elif [ "$2" = "-GPL" ]|| [ "$2" = "-MIT" ] || [ "$2" = "-Git" ]|| [ "$2" = "-C" ] || [ "$2" = "-Cpp" ]|| ["$2" = "-Py" ];then 
arg2 = "$3"
arg3 = "$2"
fi
mkdir "$1"; #d'abord on crée un dossier qui sera supprimé dés qu'il y aura une erreur 
		if [ "$arg2" = "-C" ]; then 
			cp /home/"$user"/.initdev/sources/main.c "$1"/
		elif [ "$arg2" = "-C++" ] || ["$arg2" = "-Cpp"]; then
			cp /home/"$user"/.initdev/sources/main.cpp "$1"/
		elif ["$arg2" = "-Py"]; then
			cp /home/"$user"/.initdev/sources/main.py "$1"/
		elif ["$arg2" = "-Latex"]; then
			cp /home/"$user"/.initdev/sources/latexMin.tex "$1"/
			mv "$1"/latexMin.tex "$1"/main.tex
		elif ["$arg2" = "-Latex"]; then
			cp /home/"$user"/.initdev/sources/beamer.tex "$1"/
			mv "$1"/beamer.tex "$1"/main.tex
		else
			echo "you must set projet type, please check the help: initdev -help";	
	fi
	if [ "$arg3" = " -GPL" ]; then
		cp /home/"$user"/.initdev/licences/GPL "$1"/
		mv "$1"/GPL "$1"/licence
		touch "$1"/makefiles;
		elif ["$arg3" = "-MIT" ]; then 
			cp /home/"$user"/.initdev/licences/MIT "$1"/
			mv "$1"/MIT "$1"/licence
			touch "$1"/makefiles;
	fi





















