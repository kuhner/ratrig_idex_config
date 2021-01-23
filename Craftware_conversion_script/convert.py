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
                print("Changed this one")
                print(line)
                t_val = line[1]
                index_of_X = line.index("X")
                index_of_Y = line.index("Y")
                index_of_Z = line.index("Z")
                index_of_F = line.index("F")

                x_val = line[index_of_X:index_of_Y-1]
                y_val = line[index_of_Y:index_of_Z-1]
                z_val = line[index_of_Z:index_of_F-1]
                f_val = line[index_of_F:index_of_F-2]#-2 to get rid of newline character
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