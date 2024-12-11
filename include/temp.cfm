import os

def find_mentioned_files(qry_removed_path, include_path):
    # Get all filenames from the qry_REMOVED directory
    removed_files = [
        file for file in os.listdir(qry_removed_path)
        if os.path.isfile(os.path.join(qry_removed_path, file))
    ]
    
    # Get all .cfm files from the include directory and its subdirectories
    include_files = []
    for root, _, files in os.walk(include_path):
        include_files.extend(
            os.path.join(root, file) for file in files if file.endswith('.cfm')
        )

    # Search for each filename in the content of include files
    mentioned_files = []
    for removed_file in removed_files:
        is_mentioned = False
        for include_file in include_files:
            with open(include_file, 'r', encoding='utf-8') as f:
                content = f.read()
                if removed_file in content:
                    mentioned_files.append(removed_file)
                    is_mentioned = True
                    break
        if not is_mentioned:
            print(f"Not mentioned: {removed_file}")
    
    # Return the list of mentioned files
    return mentioned_files

# Paths to directories
qry_removed_path = r"C:\Users\xkking\Documents\qry_REMOVED"
include_path = r"C:\Users\xkking\Documents\new-actorsoffice\new-theactorsoffice\include"

# Run the function and print the results
mentioned_files = find_mentioned_files(qry_removed_path, include_path)
print("\nMentioned files:")
for file in mentioned_files:
    print(file)
