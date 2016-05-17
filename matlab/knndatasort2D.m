function [Dataset] = knndatasort2D(DATA, NumberOfPatients,Distances,Angles,Planes)

%Datasæt (Antal patienter * metrics (Distance 1, Angle 0, x, y, z)
Dataset = zeros(NumberOfPatients, Distances*Angles*Planes*12);
%12 = metrics


%Først alt data for plan X, angle 0, my_asm, distance 1-10
%Næst alt data for plan X, angle 0, my_conn, distance 1-10
%.
%.
%.
%Næst alt data for plan X, angle 45, my_asm, distance 1-10
%ect..
%Efter alle angles, næste plan

for i = 1:NumberOfPatients %datasæt
    for m = 1:Planes %plans x,y,z
        for a = 1:Angles
            for d = 1:Distances
                DTM = Distances*12; %Distance Times Metrics, increments in angles
                PDTM = DTM * Angles; %Plan times DTM, increments in planes
                Dataset(i,d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_asm;
                Dataset(i,Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_con;
                Dataset(i,2*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_corr;
                Dataset(i,3*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_var;
                Dataset(i,4*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_idm;
                Dataset(i,5*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_sa;
                Dataset(i,6*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_sv;
                Dataset(i,7*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_se;
                Dataset(i,8*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_en;
                Dataset(i,9*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_dv;
                Dataset(i,10*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_de;
                Dataset(i,11*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.my_imoc1;
                %Dataset(j+10*(i-1),k,m,1) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc2;
            end
        end
    end
end
%dataset({Dataset 'X angle0 D1','Y angle0 D1','Z angle0 D1'},'obsnames',{'COL1', 'COL13','COL25'});

