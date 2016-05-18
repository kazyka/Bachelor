function [Dataset] = knndatasort2D(DATA, NumberOfPatients,Distances,Angles,Planes)

%Datasæt (Antal patienter * metrics (Distance 1, Angle 0, x, y, z)
Dataset = zeros(NumberOfPatients, Distances*Angles*Planes*13);
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
        for a = 1:Angles %angles, 0 45 90 135
            for d = 1:Distances % 1..10
                DTM = Distances*13; %Distance Times Metrics, increments in angles
                PDTM = DTM * Angles; %Plan times DTM, increments in planes
                Dataset(i,d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.angularSecondMoment;
                Dataset(i,Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.contrast;
                Dataset(i,2*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.correlation;
                Dataset(i,3*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.variance;
                Dataset(i,4*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.inverseDifferenceMoment;
                Dataset(i,5*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.sumAverage;
                Dataset(i,6*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.sumVariance;
                Dataset(i,7*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.sumEntropy;
                Dataset(i,8*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.entropy;
                Dataset(i,9*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.differenceVariance;
                Dataset(i,10*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.differenceEntropy;
                Dataset(i,11*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.informationMeasuresOfCorrelation1;
                Dataset(i,12*Distances+d+DTM*(a-1)+PDTM*(m-1)) = DATA{i}{a+4*(m-1)+12*(d-1),1}.informationMeasuresOfCorrelation2;
            end
        end
    end
end
%dataset({Dataset 'X angle0 D1','Y angle0 D1','Z angle0 D1'},'obsnames',{'COL1', 'COL13','COL25'});

