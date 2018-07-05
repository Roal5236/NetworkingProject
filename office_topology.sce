



clear;
clc;

//1. create and Display Office Topology 
NameOfNetwork='office Topology';// Name of your network
NumberOfNodes=input("Enter number of nodes");//Number of Nodes in the network
ConnectionEndingNode=[1 2]; //Ending Nodes of the connection lines
ConnectionStartingNode=[1 2];//Ending Nodes of the connection lines
x=(NumberOfNodes/2)*100;//the initial position of the first node
k=300;//a variable used later for incrementing so that we can get the next x position of the node
pp=700;//a variable used later for incrementing so that we can get the next y position of the node

XCoordinatedOfNodes=[450 650];// X-Coordinates of the nodes
YCoordinatedOfNodes=[550 550];// Y-Coordinates of the nodes

for i=1:NumberOfNodes//Adding Connection Staring and Connection Ending nodes
    ConnectionEndingNode($+1)=i;//adding connection starting node
    ConnectionStartingNode($+1)=i;//adding connection ending node
end

nn=0;

bb=modulo((NumberOfNodes-2),8);//excess nodes when divided by 8
cc=(NumberOfNodes-bb-2)/8;//quotient when divided by 8
//3.Insert new nodes at specific edges
while(nn<cc)//This gives us the number of rows which are exactly divisible by the number of nodes in each row ie 8
    for i=1:2//adding 2 nodes to top
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//incrementing variable for new position of next node
    
    for i=1:2//adding 2 nodes to bottom
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
    m=l+100;//incrementing variable for new position of next node
    
    for i=1:2//adding nodes to next top
        XCoordinatedOfNodes($+1)=m;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        m=m+50;//incrementing variable for new position of next node
    end
    
     ii=m+100;//incrementing variable for new position of next node
    
    for i=1:2//adding nodes to next bottom
        XCoordinatedOfNodes($+1)=ii;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        ii=ii+50;//incrementing variable for new position of next node
    end
    

    nnn=modulo(nn,2);//Excess Nodes
    
    if(nnn==0),
        pp=pp-50;//new y position for the excess nodes
    else,
        pp=pp-200;//new y position for the excess nodes
    end
    nn=nn+1;//increment the varible for while loop
    k=300;//restore variable for initial position of the x axis
end
//4.insert new edges
if(bb>0 & bb<=2),
     for i=1:bb//adding nodes to top if the excess nodes are less than 2
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end  

elseif(bb>2 & bb<=4),
    for i=1:2//adding nodes to top if the excess nodes are less than 4 and greater than 2
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//incrementing variable for new position of next node
    
    for i=1:(bb-2)//adding nodes to bottom if the excess nodes are less than 4 and greater than 2
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;
    end
    
elseif(bb>4 & bb<=6),
    for i=1:2//adding nodes to top if the excess nodes are less than 6 and greater than 4
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//incrementing variable for new position of next node
    
    for i=1:2//adding nodes to bottom if the excess nodes are less than 6 and greater than 4
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
    m=l+100;//incrementing variable for new position of next node
    
    for i=1:2//adding nodes to top if the excess nodes are less than 6 and greater than 4
        XCoordinatedOfNodes($+1)=m;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        m=m+50;//incrementing variable for new position of next node
    end
    
elseif(bb>6 & bb<=8),
    for i=1:2//adding nodes to top if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=k;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        k=k+50;//incrementing variable for new position of next node
    end
    
    l=k+100;//incrementing variable for new position of next node
    
    for i=1:2// adding node to bottom if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=l;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        l=l+50;//incrementing variable for new position of next node
    end
    
    m=l+100;//incrementing variable for new position of next node
    
    for i=1:2//adding nodes to top if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=m;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        m=m+50;
    end
    
    oo=m+100;//incrementing variable for new position of next node
    
    for i=1:1//adding nodes to bottom if the excess nodes are less than 8 and greater than 6
        XCoordinatedOfNodes($+1)=oo;//adding the x position of node
        YCoordinatedOfNodes($+1)=pp;//adding the y position of node
        oo=oo+50;//incrementing variable for new position of next node
    end
end

NumberOfNodes=NumberOfNodes+1;//increase number of nodes by 1
XCoordinatedOfNodes($+1)=850;//adding nodes at the center of the blocks for ensuring the mesh connection
YCoordinatedOfNodes($+1)=550;//adding nodes at the center of the blocks for ensuring the mesh connection

[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,ConnectionEndingNode,ConnectionEndingNode,XCoordinatedOfNodes,YCoordinatedOfNodes)//Creates the Ring topoplogy

WindowIndex=1;//Graph Window Number

[VisualizeGraph1] = NL_G_ShowGraph(TopologyGraph,WindowIndex);// Visualize the Graph

[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges zzz

EdgeIndex=7;//edge index
NewNodeQuantity=2;//quantity of new nodes
[go]=NL_G_SplitEdge(TopologyGraph,EdgeIndex,NewNodeQuantity);//application of NL_G_SplitEdge
WindowIndex=3;//window index
VisualizeGraph1=NL_G_ShowGraphNE(go,WindowIndex)//visualise graph

NewEdgeHeadVector=[12 13 21 20 14 15 17 16 24 25 22 23];//HeadVEctor
NewEdgeTailVector=[1 1 1 1 2 2 35 35 35 35 2 2];//TailVector

NewEdgeNameVector=['e5' 'e6' 'e7' 'e8'];//name vector of new edges
[TopologyGraph]  = NL_G_AddEdges(go,NewEdgeHeadVector,NewEdgeTailVector,NewEdgeNameVector);//Create office Topology
WindowIndex=4;
VisualizeGraph1=NL_G_ShowGraphNE(TopologyGraph,WindowIndex);//display graph

// 7. Display the number of nodes and edges again after adding the nodes and edges. 
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 








