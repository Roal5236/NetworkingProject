clear;
clc;


//1. create and Display Lab Topology 
NameOfNetwork='Lab Topology';// Name of your network
NumberOfNodes=input("Enter number of nodes");//Number of Nodes in the network
ConnectionEndingNode=[1 2]; //Ending Nodes of the connection lines
ConnectionStartingNode=[1 2];//Starting Nodes of the connection lines
x=(NumberOfNodes/2)*100;//inital position of starting node
k=300;//a variable used later for incrementing so that we can get the next x position of the node
pp=900;//a variable used later for incrementing so that we can get the next y position of the node

XCoordinatedOfNodes=[100 200];// X-Coordinates of the nodes
YCoordinatedOfNodes=[pp pp];// Y-Coordinates of the nodes

for i=1:NumberOfNodes//adding Starting and connection nodes
    ConnectionEndingNode($+1)=i;//adding connection starting node
    ConnectionStartingNode($+1)=i;//adding connection ending node
end

nn=0;//variable to use as a counter for the while loop

bb=modulo((NumberOfNodes-2),6);//excess ndes when divided by 6
cc=(NumberOfNodes-bb-2)/6;//quotient when divided by 6

//3. insert new nodes in the specified edge
while(nn<cc)//This gives us the number of rows which are exactly divisible by the number of nodes in each row ie 6
    for i=1:3//adding 3 nodes in a row on the left
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+100;//incrementing variable for new position of next node
    end
    
    l=k+100;//incrementing variable for new position of next node
    
    for i=1:3//adding 3 nodes in a row on the right
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+100;//incrementing variable for new position of next node
    end
    
    nn=nn+1;//incremneting the varibles for the while loop
    pp=pp-100;//decrementing the y position for the new row
    k=300;//restioring the inital x position
end

//4.inserting new edge
if(bb>0 & bb<=3),
     for i=1:bb//adding nodes to left if the excess nodes are less than 3 and greater than 0
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+100;//incrementing variable for new position of next node
    end  

elseif(bb>3 & bb<6),
    for i=1:3//adding nodes to left if the excess nodes are less than 6 and greater than 3
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+100;//incrementing variable for new position of next node
    end
    
    l=k+100;//incrementing variable for new position of next node
    
    for i=1:(bb-3)//adding nodes to right if the excess nodes are less than 6 and greater than 3
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+100;//incrementing variable for new position of next node
    end
end

[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,ConnectionEndingNode,ConnectionEndingNode,XCoordinatedOfNodes,YCoordinatedOfNodes)//Creates the lab topoplogy

WindowIndex=1;//window index

[VisualizeGraph1] = NL_G_ShowGraph(TopologyGraph,WindowIndex);//display graph

[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//extract nodes and edges
disp(ExtractNode,ExtractEdge); //displays the number of nodes and edges

//5. insert new nodes in the specified edge
EdgeIndex=7;//edge index
NewNodeQuantity=2;//quantity of new nodes
[go]=NL_G_SplitEdge(TopologyGraph,EdgeIndex,NewNodeQuantity);//application of NL_G_SplitEdge
WindowIndex=3;//window index
VisualizeGraph1=NL_G_ShowGraphNE(go,WindowIndex)//visualise graph

NewEdgeHeadVector=[1 2];//head vector of new edges
NewEdgeTailVector=[2 3];//tail vector of new edges

start=3;//starting node
ends=4;//ending node

for i=1:cc//adding nodes
    
    for i=start:(start+4)//adding 4 nodes to headVector
    
       NewEdgeHeadVector($+1)=i;//adding nodes to headVector
    
    end
    
    
    for i=ends:(ends+4)//adding 4 nodes to tailVector
        
       NewEdgeTailVector($+1)=i;//adding nodes to tailVector
       
    end
    
    start=start+6;//incrementind the starting position for spacing
    ends=ends+6;///incrementind the starting position for spacing

end

for i=1:1
    
    for i=start:(bb+start-2)//adding 4 nodes to headVector
    
       NewEdgeHeadVector($+1)=i;//adding nodes to headVector
    
    end
    
    
    for i=ends:(ends+bb -2)//adding 4 nodes to tailVector
        
       NewEdgeTailVector($+1)=i;//adding nodes to tailVector
       
    end
    
    start=start+6;//incrementind the starting position for spacing
    ends=ends+6;////incrementind the starting position for spacing

end


busStart=3;//variable for storing the initial position of the remaning nodes to headVector
busEnd=9;//variable for storing the initial position of the remaning nodes to tailVector

for i=1:cc
    
       NewEdgeHeadVector($+1)=busStart;//adding remaning nodes to headVector
        
       NewEdgeTailVector($+1)=busEnd;//adding remaning nodes to tailVector
       
       busStart=busStart+6;//incrementind the starting position for spacing
       busEnd=busEnd+6;//incrementind the starting position for spacing

end


NewEdgeNameVector=['e5' 'e6' 'e7' 'e8'];//name vector of new edges
[TopologyGraph]  = NL_G_AddEdges(go,NewEdgeHeadVector,NewEdgeTailVector,NewEdgeNameVector);//Create graph with head & tail nodes
WindowIndex=4;//window index

VisualizeGraph1=NL_G_ShowGraphNE(TopologyGraph,WindowIndex);//display graph

WindowIndex=5;//window index
NeworkSquareArea=1000;//Nework Square Area
LocalityRadius=1000000;//LocalityRadius
[TopologyGraph4]=NL_T_LocalityConnex(NumberOfNodes , NeworkSquareArea ,LocalityRadius);//Display Graph with number of nodes and area

