"""Main file for creating visual representation for the results."""

import matplotlib.pyplot as plt
import numpy as np

class Visual():
    """Storing and calling the functions."""
    def __init__(self):
        pass
    
    def open_data(self):
        """Open the data.txt file"""

        lines = []

        with open("data.txt", "r") as data_file:
            for line in data_file:
                lines.append(line)
        return lines
    
    def format_data(self):
        """Format the list of lines to display it in a correct way."""
        unedited_lines = Visual.open_data(self)

        prog_languages = []
        lang_times = []

        for e in unedited_lines:
            name, time_ms = e.strip().split(':')
            prog_languages.append(name)
            lang_times.append(float(time_ms.replace(' ms', '')))

        return prog_languages, lang_times
    
    def visualize_data(self):
        """Visualize the data that comes from the Levenshtein benchmark."""
        prog_languages, lang_times = Visual.format_data(self)
        plt.figure(figsize=(12, 8))
        plt.barh(prog_languages, lang_times, color='skyblue')
        plt.xlabel('Execution Time (ms)')
        plt.title('Levenshtein Distance')
        plt.gca().invert_yaxis()
        plt.tight_layout()
        plt.show()

class VisualJavaScript():
    """Storing and calling the functions to visualize the Levenshtein benchmark for JS."""

    def __init__(self):
        pass

    def open_data_js(self):
        """Open the javascript.txt file."""
        lines = []

        with open("javascript.txt", "r") as fn:
            for line in fn:
                lines.append(line)
        return lines
    
    def format_data_js(self):
        """Format the data to display it nicely."""
        origin_lines = VisualJavaScript.open_data_js(self)

        js_languages = []
        js_languages_times = []

        for e in origin_lines:
            name, time_ms = e.strip().split(':')
            js_languages.append(name)
            js_languages_times.append(float(time_ms.replace(' ms', '')))
        return js_languages, js_languages_times
    
    def visualize_js_data(self):
        """Visualize the formatted data to display it."""
        prog_languages, lang_times = VisualJavaScript.format_data_js(self)
        plt.figure(figsize=(12, 8))
        plt.barh(prog_languages, lang_times, color='skyblue')
        plt.xlabel('Execution Time (ms)')
        plt.title('Levenshtein Distance | JS | Angular | NodeJS ')
        plt.gca().invert_yaxis()
        plt.tight_layout()
        plt.show()        




if __name__ == "__main__":
    visualization = Visual()
    print(visualization.visualize_data())

    visualization_js = VisualJavaScript()
    print(visualization_js.visualize_js_data())
