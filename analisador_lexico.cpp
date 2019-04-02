#include<bits/stdc++.h>
#include <ctype.h>//isspace

using namespace std;

std::vector<string> tokens;

bool verificaTokenExistente(string str){
  for(int i=0;i<tokens.size();i++){
    if(tokens[i] == str){//str.compare(tokens[i]) == 0
      return true;//já existe na lista de tokens
    }
  }
  return false;//nao existe na lista de tokens
}

void split(string str) 
{ 
   string word = ""; 
   for (auto x : str) 
   { 
      if (x == ' ') 
      { 
        if(!verificaTokenExistente(word)){
          tokens.push_back(word); 
        } 
        word = ""; 
      } 
      else
      {
        word = word + x; 
      } 
  }
  if(!verificaTokenExistente(word)){
    tokens.push_back(word); 
  }
}

int main(){

	string s, aux = "";
  //ifstream arq ("padrao.txt");
  char t;
  FILE * arq;
  arq = fopen("padrao.txt", "r");
  //if(arq.is_open()){
    while((t = fgetc(arq)) != EOF){
      // getline(arq,s);
      // split(s);
      if(isspace(t)){
        if(!verificaTokenExistente(aux)){
          if(aux != ""){
            tokens.push_back(aux); 
          }
        } 
        aux = ""; 
      }
      else{
        aux += t;
      }
    }
    if(!verificaTokenExistente(aux)){
      if(aux != ""){
        tokens.push_back(aux); 
      }
    }
    fclose(arq);
   // arq.close();
  //}
	
	// for(int i=0;i<tokens.size();i++){
	// 	cout << tokens[i] << " ";
	// }
	// cout << endl;

  ofstream out;
  out.open("tokens.txt");
  out << "TOKENS:\n\n";
  for(int i=0;i<tokens.size();i++){
    out << tokens[i] << "\n";
  }
  out.close();

  string ent;
  while(cin >> ent)
  {
      bool acept = true;
      for(int j=0;j<tokens.size();j++)
      {
        if(tokens[j] == ent)//tokens[j].compare(entrada[i]) == 0
        {
          cout << ent << " eh aceito!" << endl;
          acept = false;
          break;
        }
      }
      if(acept == true)
      {
        cout << ent << " nao eh aceito!" << endl;
      }
  }

	return 0;
}