# coding : utf-8

import random
import os
os.system("clear")

class Joueur:

	def __init__(self, Nom_Joueur, Dernier_Score = 0, meilleur_Score = 0):
		self.Nom = Nom_Joueur
		self.dScore = Dernier_Score
		self.mScore = meilleur_Score

	def calculeScore(self, Score):
		self.dScore = Score
		if self.dScore > self.mScore:
			self.mScore = self.dScore





def funAffichage(objet, nom_Joueur):
	os.system("clear")
	print("C'est le tour de {}".format(nom_Joueur))
	i = 0
	while i < len(objet):
		l = ["|	"] + ["*"]*objet[i] + [" "]*(max(objet) - objet[i]) + ["	|"]
		chaine = "".join(l)
		print("{} {} {}".format(i+1, chaine, objet[i]))
		i += 1
	print("veuiller s'il vous plait rentré sous cette forme: <numero_du_tas> - <nombre_de_pierre>")




def funPartie():
	"""
	initialisation de la partie
	"""
	nomJ1 = input("Entrer votre nom :")
	nomJ2 = input("Entrer votre nom :")
	nomJ1 = nomJ1.title()
	nomJ2 = nomJ2.title()
	listJoueurs = [Joueur(nomJ1), Joueur(nomJ2)]
	"""
	ficher ouverture
	"""
	nom_Fichier = "sauvegarde.txt"
	Fichier = open(nom_Fichier)
	lignes = Fichier.readlines()
	Fichier.close()
	li = lignes[0]
	li = li.strip()
	lignes = [li]
	lignes[0] = lignes[0].split(" ")
	ligne = []
	for i in lignes:
	 	ligne.append(i[0].split("	"))
	"""
	recherche
	"""

	for i in ligne:
	 	if (i[0] == nomJ1) or (i[0] == nomJ2):
	 		if i[0] == nomJ1 :
	 			listJoueurs[0].dScore = i[1]
	 			listJoueurs[0].mScore = i[2]
	 		if i[0] == nomJ2 :
	 			listJoueurs[1].dScore = i[1]
	 			listJoueurs[1].mScore = i[2]
	alea = random.randint(3,7)
	i = 0
	tas = []
	while i < alea :
		tas.append(random.randint(5,23))
		i += 1
	i = 0
	j1 = False
	J2 = False
	while sum(tas) > 0 :
		i += 1
		funAffichage(tas, nomJ1)
		des = input()
		des = des.split("-")
		des[0] = int(des[0])
		des[1] = int(des[1])
		tas[des[0] - 1] = tas[des[0] - 1] - des[1]
		if sum(tas) == 1:
			j1 = True
			break
		funAffichage(tas, nomJ2)
		des = input()
		des = des.split("-")
		des[0] = int(des[0])
		des[1] = int(des[1])
		tas[des[0] - 1] = tas[des[0] - 1] - des[1]
		if sum(tas) == 1:
			j2 = True
			break
	j = 1
	scorePartie = 0
	while j <= i:
		scorePartie = scorePartie + j*(10)**j
		j+=1
	if j1:
		listJoueurs[0].calculeScore(scorePartie)
		for i in ligne:
	 		if i[0] == listJoueurs[0].Nom:
	 			i[1] = listJoueurs[0].dScore 
	 			i[2] = listJoueurs[0].mScore
	else:
		listJoueurs[1].calculeScore(scorePartie)
		for i in ligne:
	 		if i[0] == listJoueurs[1].Nom:
	 			i[1] = listJoueurs[1].dScore 
	 			i[2] = listJoueurs[1].mScore
	Fichier = open(nom_Fichier, 'w')
	for i in ligne:
		Fichier.write(" {}	{}	{}".format(i[0],i[1],i[2]))
	Fichier.close()

funPartie()
