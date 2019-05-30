image=imread('emre.jpg');
image=im2bw(image);
image=double(image);
%imshow(image);
[y,x]=find(image==0);
y1=min(y);
y2=max(y);
x1=min(x);
x2=max(x);
cropimg=imcrop(image,[x1 y1 x2-x1 y2-y1]);
imshow(cropimg);
[m,n]=size(cropimg);
flag=0;
for i=1:n   
    if(cropimg(:,i)==1) 
        dizi(i)=1;
    else 
        dizi(i)=0;
    end
end
k=2;
index(1)=1;
for j=1:n   
   if dizi(j)==1 && flag==0
       index(k)=j-1;
       k=k+1;
       flag=1;
   else if dizi(j)==0 && flag==1
           flag=0;
           index(k)=j;
           k=k+1;
       end
   end
end
index(k)=n;
s=0;
[e f]=size(index);
	for i=1:2:round((f))
    harf=imcrop(cropimg,[index(i) 1 (index(i+1)-index(i)) y2-y1]);
    harf=imresize(harf,[60 60]);
    harf2=reshape(harf,3600,1);
    harf2=double(harf2);
    X=sim(net,harf2);
    
    s=s+1;
       result=find(X==max(X));
      if result==1
          fprintf('%d.harf "A" dýr \n',s);
          satir(s)='A';
      else if result==2
          fprintf('%d.harf "B" dýr \n',s);
          satir(s)='B';
      else if result==3
          fprintf('%d.harf "C" dýr \n',s);
          satir(s)='C';
      else if result==4
          fprintf('%d.harf "D" dýr \n',s);  
          satir(s)='D';
      else if result==5
          fprintf('%d.harf "E" dýr \n',s);
          satir(s)='E';
      else if result==6
          fprintf('%d.harf "F" dýr \n',s);
          satir(s)='F';
      else if result==7
          fprintf('%d.harf "G" dýr \n',s);  
          satir(s)='G';
      else if result==8
          fprintf('%d.harf "H" dýr \n',s);
          satir(s)='H';
      else if result==9
          fprintf('%d.harf "I" dýr \n',s);
          satir(s)='I';
      else if result==10
          fprintf('%d.harf "J" dýr \n',s);  
          satir(s)='J';
      else if result==11
          fprintf('%d.harf "K" dýr \n',s);
          satir(s)='K';
      else if result==12
          fprintf('%d.harf "L" dýr \n',s);
          satir(s)='L';
      else if result==13
          fprintf('%d.harf "M" dýr \n',s);  
          satir(s)='M';
      else if result==14
          fprintf('%d.harf "N" dýr \n',s);
          satir(s)='N';
      else if result==15
          fprintf('%d.harf "O" dýr \n',s);
          satir(s)='O';
      else if result==16
          fprintf('%d.harf "P" dýr \n',s);  
          satir(s)='P';
      else if result==17
          fprintf('%d.harf "R" dýr \n',s);  
          satir(s)='R';
      else if result==18
          fprintf('%d.harf "S" dýr \n',s);
          satir(s)='S';
      else if result==19
          fprintf('%d.harf "T" dýr \n',s);
          satir(s)='T';
      else if result==20
          fprintf('%d.harf "U" dýr \n',s);  
          satir(s)='U';
      else if result==21
          fprintf('%d.harf "V" dýr \n',s);
          satir(s)='V';
      else if result==22
          fprintf('%d.harf "Y" dýr \n',s);
          satir(s)='Y';
      else if result==23
          fprintf('%d.harf "Z" dýr \n',s);  
          satir(s)='Z';
      else if result==24
          fprintf('%d.harf "Ü" dýr \n',s);
          satir(s)='Ü';
      else if result==25
          fprintf('%d.harf "Ç" dýr \n',s);  
          satir(s)='Ç';
          end
          end
      end
      end
      end
      end
	  end
	  end
      end
      end
	  end
      end
      end
      end
	  end
	  end
      end
      end
	  end
	  end
      end
      end
	  end
	  end
      end
     
    end
fprintf(satir);