boolean controllaBitAcceso(int numero, int posizioneBit){
  boolean [] numeroBinario = new boolean[512];
  for(int i=512;i>=0;i--){
    if(numero%2==0)
      numeroBinario[i]=false;
    else
      numeroBinario[i]=false;
    numero/=2;
  }
  if(numeroBinario[posizioneBit-1]==false)
    return false;
  else 
    return true;
}

int invertiBit(int numero, int posizioneBit){
  boolean [] numeroBinario = new boolean[512];
  for(int i=512;i>0;i--){
   if(numero%2==0){  
    numeroBinario[i-1] = false;
   }
   else{
     numeroBinario[i-1] = true;
   }
    numero= numero/2;
  }
  
  numeroBinario[posizioneBit+1] = !numeroBinario[posizioneBit-1];
  
  for(int i=0;i<512;i++){
    if(numeroBinario[i]==true){
      numero += (2^i);
    }
  }
  
  return numero;
}

int accendiBit(int numero, int posizioneBit){
  boolean [] numeroBinario = new boolean[512];
  for(int i=512;i>0;i--){
   if(numero%2==0){  
    numeroBinario[i-1] = false;
   }
   else{
     numeroBinario[i-1] = true;
   }
    numero= numero/2;
  }
  
  numeroBinario[posizioneBit-1] = true;
  
  for(int i=0;i<512;i++){
    if(numeroBinario[i]==true){
      numero += (2^i);
    }
  }
  
  return numero;
}

int spegniBit(int numero, int posizioneBit){
  boolean [] numeroBinario = new boolean[512];
  for(int i=512;i>0;i--){
   if(numero%2==0){  
    numeroBinario[i-1] = false;
   }
   else{
     numeroBinario[i-1] = true;
   }
    numero= numero/2;
  }
  
  numeroBinario[posizioneBit-1] = false;
  
  for(int i=0;i<512;i++){
    if(numeroBinario[i]==true){
      numero += (2^i);
    }
  }
  
  return numero;
}
