
clear;
clc;

//1. create and Display Class Topology 

NameOfNetwork='Class Topology';// Name of your network
NumberOfNodes=input("Entern no of students");//Numb.0er of Nodes in the network
ConnectionEndingNode=[1 2]; //Ending Nodes of the connection lines
ConnectionStartingNode=[1 2];//Starting Ndes of the connection lines
x=(NumberOfNodes/2)*100;//find the number of rows
k=300;//variable for starting x position
pp=700;//variable for starting y position

XCoordinatedOfNodes=[500 700];// X-Coordinates of the nodes
YCoordinatedOfNodes=[900 900];// Y-Coordinates of the nodes

for i=1:NumberOfNodes//Add connection Stating and Ending Nodes
    ConnectionEndingNode($+1)=i;//adding connection starting node
    ConnectionStartingNode($+1)=i;//adding connection ending node
end

nn=0;//variable to use as a counter for the while loop

bb=modulo((NumberOfNodes-2),8);//excess nodes when divided by 8
cc=(NumberOfNodes-bb-2)/8;//quotient when divided by 8

//3. insert new nodes in the specified edge 
while(nn<cc)//This gives us the number of rows which are exactly divisible by the number of nodes in each row ie 8
    for i=1:2//adding 2 nodes in a row on the left
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//staring position of the next node in the next column
    
    for i=1:2//adding 2 nodes in a row on the left-center
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
    m=l+100;//adding a space between 2 columns
    
    for i=1:2//adding 2 nodes in a row on the right-center
        XCoordinatedOfNodes($+1)=m;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        m=m+50;//incrementing variable for new position of next node
    end
    
     ii=m+100;//staring position of the next node in the next column
    
    for i=1:2//adding 2 nodes in a row on the right
        XCoordinatedOfNodes($+1)=ii;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        ii=ii+50;//incrementing variable for new position of next node
    end
    
    nn=nn+1;//incrementing the variable for the while loop
    pp=pp-100;//decrementing the variable for the y axis so that we can repeat the process on a new row
    k=300;//restoring the x axis varible to its intial position
end

//4.inserting new edge
if(bb>0 & bb<=2),
     for i=1:bb//adding nodes to left if the excess nodes are less than 2 and greater than 0
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end  

elseif(bb>2 & bb<=4),
    for i=1:2//adding nodes to left if the excess nodes are less than 4 and greater than 2
        XCoordinatedOfNodes($+1)=k;
        YCoordinatedOfNodes($+1)=pp;
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//staring position of the next node in the next column
    
    for i=1:(bb-2)//adding nodes to left-center if the excess nodes are less than 4 and greater than 2
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
elseif(bb>4 & bb<=6),
    for i=1:2//adding nodes to left if the excess nodes are less than 6 and greater than 4
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;
    end
    
    l=k+100;//staring position of the next node in the next column
    
    for i=1:2//adding nodes to left-center if the excess nodes are less than 6 and greater than 4
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
    m=l+100;//staring position of the next node in the next column
    
    for i=1:2//adding nodes to right-center if the excess nodes are less than 6 and greater than 4
        XCoordinatedOfNodes($+1)=m;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        m=m+50;//incrementing variable for new position of next node
    end
    
elseif(bb>6 & bb<=8),
    for i=1:2//adding nodes to left if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//staring position of the next node in the next column
    
    for i=1:2//adding nodes to left-center if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
    m=l+100;//staring position of the next node in the next column
    
    for i=1:2//adding nodes to right-center if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=m;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        m=m+50;//incrementing variable for new position of next node
    end
    
    oo=m+100;//staring position of the next node in the next column
    
    for i=1:2//adding nodes to right if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=oo;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        oo=oo+50;//incrementing variable for new position of next node
    end
end

[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,ConnectionEndingNode,ConnectionEndingNode,XCoordinatedOfNodes,YCoordinatedOfNodes)//Creates the Class topoplogy

WindowIndex=1;//Graph Window Number

[VisualizeGraph1] = NL_G_ShowGraph(TopologyGraph,WindowIndex);// Visualize the Graph

[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 

EdgeIndex=7;//edge index
NewNodeQuantity=2;//quantity of new nodes
[go]=NL_G_SplitEdge(TopologyGraph,EdgeIndex,NewNodeQuantity);//application of NL_G_SplitEdge
WindowIndex=3;//window index
VisualizeGraph1=NL_G_ShowGraphNE(go,WindowIndex)

NewEdgeHeadVector=[3 4];//head vector of new edges
NewEdgeTailVector=[2 2];//tail vector of new edges

for i=5:NumberOfNodes
    NewEdgeHeadVector($+1)=i;//adding remaning nodes to headVector
    NewEdgeTailVector($+1)=2;//adding remaning nodes to tailVector
end

NewEdgeHeadVector($+1)=2;//adding remaning nodes to headVector
NewEdgeTailVector($+1)=1;//adding remaning nodes to tailVector

NewEdgeNameVector=['e5' 'e6' 'e7' 'e8'];//name vector of new edges
[TopologyGraph]  = NL_G_AddEdges(go,NewEdgeHeadVector,NewEdgeTailVector,NewEdgeNameVector);//Create Office Tpology
WindowIndex=4;//window index
VisualizeGraph1=NL_G_ShowGraphNE(TopologyGraph,WindowIndex);//Display Graph




