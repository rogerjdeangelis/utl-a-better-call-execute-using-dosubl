
A better call execute using dosubl                                                                         
                                                                                                           
DUMB EXAMPLE: I realize there are other ways to split sashelp.class                                        
                                                                                                           
DOSUBL uses macro text instead of unreadable complex quoting                                               
                                                                                                           
Problem                                                                                                    
                                                                                                           
  Execute two datasteps splitting sashelp.class in male and female tables after parent datasetp            
                                                                                                           
github                                                                                                     
https://tinyurl.com/y3xaxhvs                                                                               
https://github.com/rogerjdeangelis/utl-a-better-call-execute-using-dosubl                                  
                                                                                                           
*_                   _                                                                                     
(_)_ __  _ __  _   _| |_                                                                                   
| | '_ \| '_ \| | | | __|                                                                                  
| | | | | |_) | |_| | |_                                                                                   
|_|_| |_| .__/ \__,_|\__|                                                                                  
        |_|                                                                                                
;                                                                                                          
                                                                                                           
                                                                                                           
filename cde "d:/sas/exec.sas" mod;                                                                        
                                                                                                           
data control;                                                                                              
                                                                                                           
  sex="F";output;                                                                                          
  sex="M";output;                                                                                          
                                                                                                           
run;quit;                                                                                                  
                                                                                                           
/* control meta data                                                                                       
                                                                                                           
WORK.CONTROL total obs=2                                                                                   
                                                                                                           
Obs    SEX                                                                                                 
                                                                                                           
 1      F                                                                                                  
 2      M                                                                                                  
                                                                                                           
                                                                                                           
SASHELP.CLASS total obs=19                                                                                 
                                                                                                           
 NAME       SEX    AGE    HEIGHT    WEIGHT                                                                 
                                                                                                           
 Alfred      M      14     69.0      112.5                                                                 
 Alice       F      13     56.5       84.0                                                                 
 Barbara     F      13     65.3       98.0                                                                 
 Carol       F      14     62.8      102.5                                                                 
 Henry       M      14     63.5      102.5                                                                 
                                                                                                           
*/                                                                                                         
                                                                                                           
*            _               _                                                                             
  ___  _   _| |_ _ __  _   _| |_                                                                           
 / _ \| | | | __| '_ \| | | | __|                                                                          
| (_) | |_| | |_| |_) | |_| | |_                                                                           
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                          
                |_|                                                                                        
;                                                                                                          
                                                                                                           
                                                                                                           
WORK.M total obs=10                                                                                        
                                                                                                           
  NAME       SEX    AGE    HEIGHT    WEIGHT                                                                
                                                                                                           
  Alfred      M      14     69.0      112.5                                                                
  Henry       M      14     63.5      102.5                                                                
  James       M      12     57.3       83.0                                                                
  Jeffrey     M      13     62.5       84.0                                                                
  John        M      12     59.0       99.5                                                                
  Philip      M      16     72.0      150.0                                                                
  Robert      M      12     64.8      128.0                                                                
  Ronald      M      15     67.0      133.0                                                                
  Thomas      M      11     57.5       85.0                                                                
  William     M      15     66.5      112.0                                                                
                                                                                                           
                                                                                                           
WORK.F total obs=9                                                                                         
                                                                                                           
  NAME       SEX    AGE    HEIGHT    WEIGHT                                                                
                                                                                                           
  Alice       F      13     56.5       84.0                                                                
  Barbara     F      13     65.3       98.0                                                                
  Carol       F      14     62.8      102.5                                                                
  Jane        F      12     59.8       84.5                                                                
  Janet       F      15     62.5      112.5                                                                
  Joyce       F      11     51.3       50.5                                                                
  Judy        F      14     64.3       90.0                                                                
  Louise      F      12     56.3       77.0                                                                
  Mary        F      15     66.5      112.0                                                                
                                                                                                           
*                                                                                                          
 _ __  _ __ ___   ___ ___  ___ ___ ___                                                                     
| '_ \| '__/ _ \ / __/ _ \/ __/ __/ __|                                                                    
| |_) | | | (_) | (_|  __/\__ \__ \__ \                                                                    
| .__/|_|  \___/ \___\___||___/___/___/                                                                    
|_|                                                                                                        
;                                                                                                          
                                                                                                           
%symdel sex / nowarn; /* need this if sex is global (like in macros) */                                    
                                                                                                           
data nxtStp;                                                                                               
                                                                                                           
  set control;                                                                                             
                                                                                                           
  call symputx("sex",sex);                                                                                 
                                                                                                           
  rc=dosubl(%tslit(                                                                                        
              data _null_;                                                                                 
              file cde;                                                                                    
                put "                                                                                      
                  data &sex;                                                                               
                    set sashelp.class(where=(sex='&sex'));                                                 
                  run;quit;";                                                                              
              run;quit;                                                                                    
               ));                                                                                         
                                                                                                           
run;quit;                                                                                                  
                                                                                                           
                                                                                                           
%inc "d:/sas/exec.sas";                                                                                    
                                                                                                           
                                                                                                           
