import os
print("USAGE: ")
print("Enter your current directory path in 1st prompt")
print("Enter your Source directory path in 2nd prompt, eg: 'vendor/10or/holland2/proprietary/vendor'")
print("Enter your Destination directory path in 3rd prompt, eg: '$(TARGET_COPY_OUT_VENDOR)' or '$(TARGET_COPY_OUT_SYSTEM)'")
print("")
print("")
path = input("Enter your current directory path: ")
source_path = input("Source directory path: ")
destination_path = input("Destination directory path: ")
string = path
print ("***********************************")
#we shall store all the file names in this list
filelist = []

for root, dirs, files in os.walk(path):
	for file in files:
        #append the file name to the list
		filelist.append(os.path.join(root,file))

Path_Leinght = (len(string) - string.count(" "))
#print all the file names
for name in filelist:
    print("    "+source_path+name[Path_Leinght:]+":"+destination_path+name[Path_Leinght:]+" \\")
