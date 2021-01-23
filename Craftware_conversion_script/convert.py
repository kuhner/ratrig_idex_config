# Purpose of this is to remove the "T# X Y Z" commands that Craftware uses and replaces them with a separate T# and G0 command
import os
directory_path = os.getcwd()
print("My current directory is : " + directory_path)

directories = os.listdir( directory_path )
 
potential_extensions = ('.g', '.gcode')
for file in directories:
    print(file)
    if file.endswith(potential_extensions) and file.find("_FIXED.") == -1:
        file_to_fix = open (file, "r")
        # Read list of lines
        out = [] # list to save lines
        while True:
            # Read next line
            line = file_to_fix.readline()
            # If line is blank, then you struck the EOF
            if not line :
                break
            if line.startswith("T"):
                print("Change this one")
                print(line)
                t_val = line[1]
                x_val = line[4:9]
                y_val = line[12:17]
                z_val = line[20:25]
                f_val = line[27:31]
                out.append("T" + t_val + ";select tool")
                out.append("G1 X" + x_val + " Y" + y_val + " Z" + z_val + " F" + f_val)
            else:
                out.append(line.strip())
        # Close old file 
        file_to_fix.close()

        #Create fixed file and write new lines
        new_file_name = file.replace(".", "_FIXED.")
        wr = open(new_file_name, "w")
        for line in out:
            # write all lines
            wr.write(line)
            wr.write("\n")
        wr.close()