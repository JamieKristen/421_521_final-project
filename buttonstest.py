#!/usr/bin/python

import Tkinter as tk


root=tk.Tk() # this will create the window

def get_value():

    fpoint=int(entry1.get()) # Gets point 1
    lpoint=int(entry2.get()) # Gets point 2
    points=[fpoint,lpoint]

    ####### MODIFY A VARIABLE IN PARENT #######
    root.geometry(entry1.get() + "x" + entry2.get())

box1=tk.Label(root, text="First point")  # Label of box 1
entry1=tk.Entry(root)                    # Box 1

box2=tk.Label(root, text="Last point")   # Label of box 2
entry2=tk.Entry(root)                    # box 2

Done_button=tk.Button(root, name="done") #Button to terminate the "gui"

####### Configuring the button to call a function when pressed  #######
Done_button.configure(command=get_value)
#Done_button.bind("<Button-1>",get_value) # Run function "get_value" on click
box1.grid(row=1, sticky="W",padx=4)             # position of label for box1
entry1.grid(row=1,column=1,sticky="E", pady=4)  # position of box 1
box2.grid(row=2, sticky="W",padx=4)             # position of label for box2
entry2.grid(row=2,column=1,sticky="E", pady=4)  # position of box2
Done_button.grid(row=3,column=1)                # position of "button



root.mainloop()
