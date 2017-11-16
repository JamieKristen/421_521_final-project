#!/usr/bin/python

import Tkinter
import tkMessageBox

top = Tkinter.Tk()
def helloCallBack() :
	tkMessageBox.showinfo( "Clothing", "Thanks for updating your wardrobe!")
def goShopping() :
	tkMessageBox.showinfo( "What are we looking for today?", "Click here to continue!")

v = Tkinter.Button (top, text ="Let's Shop!", command = goShopping)
w = Tkinter.Button (top, text ="Dress Me!", command = helloCallBack)
y = Tkinter.Button (top, text = "I Went Shopping!", command = helloCallBack)
y.pack()
w.pack()
v.pack()
top.mainloop()

