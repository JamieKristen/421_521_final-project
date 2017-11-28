#!/usr/bin/python

import Tkinter
import tkMessageBox

top = Tkinter.Tk()
def helloCallBack() :
	tkMessageBox.showinfo( "Clothing", "Thanks for updating your wardrobe!")
def goShopping() :
	tkMessageBox.askokcancel(top, text ="What are we looking for today?", command = goButtons)
def goButtonsCallBack() :
	bottom = Tkinter.Tk()	
	a = Tkinter.Button (bottom, text ="Shop Tops", command = tops)
	b = Tkinter.Button (bottom, text ="Shop Bottoms", command = tops)
	c = Tkinter.Button (bottom, text ="Shop Jackets", command = tops)
	d = Tkinter.Button (bottom, text ="Shop Shoes", command = tops)
	a.pack()
	b.pack()
	c.pack()
	d.pack()
def tops() :
	middle = Tkinter.Tk()
	e = Tkinter.Button (middle, text = "Shop via color", command = get_value)
	f = Tkinter.Button (middle, text = "Shop via stores", command = get_value)
	e.pack()
	f.pack()
def get_value() :
	root=Tkinter.Tk()
        box1=Tkinter.Label(root, text="Enter Color")
	entry1=Tkinter.Entry()
	color=int(entry1.get())
	root.geometry(entry1.get())
	entry1.pack()
v = Tkinter.Button (top, text ="Let's Shop!", command = goButtonsCallBack)
w = Tkinter.Button (top, text ="Dress Me!", command = helloCallBack)
y = Tkinter.Button (top, text = "I Went Shopping!", command = helloCallBack)
y.pack()
w.pack()
v.pack()
top.mainloop()

