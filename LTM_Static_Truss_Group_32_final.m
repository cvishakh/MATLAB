clc
clear 
%Task 2

[filename, pathname] = uigetfile;
input = load(filename);
connections = input.conn;
coordinates = input.coord;
bearing = input.bearing;
force = input.F;

%extraction of the coordinates

x= coordinates(:, 1);
y= coordinates(:, 2);


%Task 3
%Visualization of the truss


figure;
hold on; 
%grid on;
title("Truss under load case");
xlabel("X-axis");
ylabel("Y-axis");
axis equal
grid on
offset = 0.1;
%Ploting the elements & node

for i=1:length(connections(:, 1))
    plot([x(connections(i,1)) x(connections(i,2))],[y(connections(i,1)) y(connections(i,2))],'-o');
    o1 = plot([x(connections(i,1)) x(connections(i,2))],[y(connections(i,1)) y(connections(i,2))],'k');
    text((coordinates(connections(i,1),1)+coordinates(connections(i,2),1))/2,(coordinates(connections(i,1),2)+coordinates(connections(i,2),2))/2,sprintf('%d',i))
end

%Ploting the bearing
for j=1:length(bearing(:, 1))
    if bearing(j,2) == 1
    o2 = plot (coordinates(bearing(j,1),1)-offset, coordinates(bearing(j,1),2), '>r');
        else
    o2 = plot( coordinates(bearing(j,1),1), coordinates(bearing(j,1),2)-offset, '^r');
    end
end

%Ploting the force

for k=1:length(force(:, 1))
    o3 = quiver(coordinates(force(k,1),1), coordinates(force(k,1),2),force(k,2),force(k,3),'g');
 end
hold off
legend([o1, o2, o3], "Bar","Bearing","Force")

%stability

%f= 2k-(a+s)
% K= number of nodes, a = number of support connections, s = number of bars

f= (2*(length(coordinates(:,1)))-((length(bearing(:,1))+ length(connections(:,1)))));
fa= 3-(length(bearing(:,1)))

if f~=0 
    error('The system is not statically determined')
elseif fa > 0
    error('The system is not statically determined')
else
    disp(['The system is statically determined and it has  ', num2str(f),' degree of freedom'])
end


%task 5 Finding the angle
 
for l=1:(length(connections(:,1)))
    Angle(l) = atan2((coordinates(connections(l,2),2)-coordinates(connections(l,1),2)),(coordinates(connections(l,2),1)-coordinates(connections(l,1),1))); 
end

%initialinzing the equations

 A=zeros(2*length(coordinates(:,1)),length(bearing(:,1))+length(connections(:,1)));
 f=zeros(2*length(coordinates(:,1)),1);

 for i=1:length(bearing(:,1))
     tmpzeile= (bearing(i,1)-1)*2 + bearing(i,2);
     A(tmpzeile, i) =1;
 end
% solving the equation to find the coefficient matrix
 for i=1: length(connections(:,1))
    tmpknoten=connections(i,1);
    tmpzeile = (tmpknoten-1)*2 + 1;
    tmpspalte = i+length(bearing(:,1));
    A(tmpzeile,tmpspalte)= cos(Angle(i));
    A(tmpzeile+1,tmpspalte)= sin(Angle(i));
    tmpknoten=connections(i,2);
    tmpzeile = (tmpknoten-1)*2 + 1;
    tmpspalte = i+length(bearing(:,1));
    A(tmpzeile,tmpspalte)= -cos(Angle(i));
    A(tmpzeile+1,tmpspalte)= -sin(Angle(i));  
 end

 disp(A)

for i=1:length(force(:,1))
    tmpzeile= (force(i,1)-1)*2 + 1;
    f(tmpzeile)= force(i,2);
    f(tmpzeile+1)=force(i,3);
end

disp(f)
r= -A\f;
r_bars = r(length(bearing(:,1))+1:end);


%plottingthe stress for each bar 
figure;
title('Task 7 stress of each bar')
figure(2)
hold on;
grid on;
xlabel("X-axis");
ylabel("Y-axis");

Nullstress=plot([0 0],[0 0],'b');
Tension=plot([0 0],[0 0],'b');
Compression=plot([0 0],[0 0],'b');

for i=1:length(connections(:,1))
    if round(r_bars(i))==0
    Nullstress=plot([x(connections(i,1)) x(connections(i,2))], [y(connections(i,1)) y(connections(i,2))],'b');
    elseif (r_bars(i) > 0)
    Tension=plot([x(connections(i,1)) x(connections(i,2))], [y(connections(i,1)) y(connections(i,2))],'g');
    else   
    Compression=plot([x(connections(i,1)) x(connections(i,2))], [y(connections(i,1)) y(connections(i,2))],'r');    
    end
end

for i=1:length(connections(:,1))
plot([x(connections(i,1)) x(connections(i,2))], [y(connections(i,1)) y(connections(i,2))],'o');
end

axis equal
offset = 0.1;
% plotting the bearing
for j=1:length(bearing(:,1))   
    if bearing(j,2) == 1
    plot (coordinates(bearing(j,1),1)-offset, coordinates(bearing(j,1),2), '>k');
    else 
    plot (coordinates(bearing(j,1),1), coordinates(bearing(j,1),2) - offset, '^k');
    end
end

for k=1:length(force(:,1))
    quiver(coordinates(force(k,1),1),coordinates(force(k,1),2),force(k,2),force(k,3),'k');
end
hold off

legend([Nullstress,Tension,Compression],'Nullstress','Tension','Compression');
save('results_truss.mat')








































































































































