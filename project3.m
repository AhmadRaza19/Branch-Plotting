% Project 3 - Plotting with branches
% Ahmad Raza
% CS 109, Fall 2020, Koehler

clear all;
close all;

names = ["CENTRAL OVER S&S CAN","WACKER-MICHIGAN-RAND","RYAN SB RMP TO 55WB","1.3-2.6 MI SW OF I94","MICH.AVE-S.OF RIVER", "North to West Ramp","RIVER TO CANAL ST","RAMP 'G'","RANDOLPH-MICHIGAN-FI","55 EB RMP TO SB RYAN","LARAMIE    K2 AVE BR", "CANAL-HARRISON-TAYLO", "CANAL-MADISON-ADAMS"];
yearBuilt = [1970,1926,1962,1963,1921,2015,1962,2006,1937,1964,1956,1926,1926];
yearReconstruct = [2007,2002,1990,2000,1998,0,1989,0,1981,1997,1999,1983,1983];
score = [79,50,94.5,94,60.9,96,68,96,80.9,94.4,80.2,41.4,45.6];

opt = input("What would you like to plot (1-year built, 2-year reconstruct, 3-score?  ");

% TODO:  Write your code below
% When your program is functioning as expected, copy and paste the code below 
% this line into the testing script on Zybooks.  Do not copy in anything
% above this line.

%Conditional Statement for 3 types of graphs

if (opt == 1)
    %Defines opt 1 graph features
    missingY = yearBuilt;
    lineType = "rv"; %red down triangle line type
    missingWidth = 2;
    isFilled = "w";
    missingLabel = "Year Built";
    valid = 1;
elseif (opt == 2)
    %Defines opt 2 graph features
    yearReconstruct(yearReconstruct == 0) = NaN;
    missingY = yearReconstruct;
    lineType = "bo"; %blue circle line type
    missingWidth = 2;
    isFilled = "w";
    missingLabel = "Year Recontructed";
    valid = 1;
elseif (opt == 3)
    %Defines opt 3 graph features
    missingY = score;
    lineType = "g*"; %green asterik line type
    missingWidth = 2;
    isFilled = "g";
    missingLabel = "Overall Score";
    valid = 1;
else
    %assigns any other input as 0 which later gives an error message
    valid = 0; 
end
if (~isempty(names)) %Conditional Statement that runs if bridges has length greater than 0
    if (valid == 1) %Conditional Statement that runs if valid input has been entered
       x = [1:length(names)];
       plot (x, missingY, lineType, "LineWidth",missingWidth,"MarkerFaceColor",isFilled);
       xlabel ("Bridges");
       ylabel (missingLabel);
       grid on;
        if (length(names) <= 15) %Conditional Statement that only assigns xticks if bridges length is less than or equal to 15
            xticks (1:13);
            xticklabels (names);
            xtickangle(-45);
        end
    else
        %displays error message
        disp("Invalid input, input must be either 1, 2, or 3");
    end   
end
