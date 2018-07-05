clear;
clc;

//1. create and Display School Topology 
NameOfNetwork='School Topology';// Name of your network
NumberOfNodes=input("Enter number of nodes");//Number of Nodes in the network
ConnectionEndingNode=[1 2]; //Ending Nodes of the connection lines
ConnectionStartingNode=[1 2];//Starting Nodes of the connection lines
x=(NumberOfNodes/2)*100;//the initial position of the first node
k=300;//a variable used later for incrementing so that we can get the next x position of the node

n=modulo(NumberOfNodes,2);//The remainder of the nodes when divided by 2
if(n==0) then
    y=NumberOfNodes/2-1;//calculater half the number of nodes if n is 0
    b=NumberOfNodes/2-1;//calculater half the number of nodes if n is 0
    x=(NumberOfNodes/2-1)*100;//calculater starting position on the x axis
else,
    y=NumberOfNodes/2-1;//calculater half the number of nodes if n is not 0
    b=NumberOfNodes/2;//calculater half the number of nodes if n is not 0
    x=((NumberOfNodes-1)/2)*100;//calculater starting position on the x axis
end

u=100;

XCoordinatedOfNodes=[u 200];// X-Coordinates of the nodes
YCoordinatedOfNodes=[600 600];//Y-Cordinates of the nodes
//3. insert new nodes in the specified edge
for i=1:NumberOfNodes//adding the connections to each node ie the node previous to the present node are connected to each other
    ConnectionEndingNode($+1)=i;//adding connection starting node
    ConnectionStartingNode($+1)=i;//adding connection ending node
end

for i=1:y//adding half the nodes on the top at y position 600
    XCoordinatedOfNodes($+1)=k;//adding the x position of node
    YCoordinatedOfNodes($+1)=600;//adding the y position of node
    k=k+100;//incrementing variable for new position of next node
end

l=k-100;//decrementing the variable for new node row position
//4. inserting new edges
for i=1:b//adding nodes the remaining nodes at y position 200
    XCoordinatedOfNodes($+1)=l;//adding the x position of node
    YCoordinatedOfNodes($+1)=200;//adding the y position of node
    l=l-100;//incrementing variable for new position of next node
end

[TopologyGraph]=NL_G_MakeGraph(NameOfNetwork,NumberOfNodes,ConnectionEndingNode,ConnectionEndingNode,XCoordinatedOfNodes,YCoordinatedOfNodes)//Creates the School topoplogy

WindowIndex=1;//Graph Window Number

[VisualizeGraph1] = NL_G_ShowGraph(TopologyGraph,WindowIndex);// Visualize the Graph

NodeColor=5; // Node Colour 2:[Blue],3:[Green], 5:[Red]
BorderThickness=5; // Node Border thickness
NodeDiameter=25; //Node diameter 
WindowIndex=2;//window index
ListOfNodes=[1 2];//list of starting nodes

z=input("Enter no of Labs")//Entern the number of labs
z=z-3;
for i=3:(z+3)//adding connections
    ListOfNodes($+1)=i;//connection the previous node and the present node
end
//list of nodes
[NodeHighlight,VisualizeGraph1]=NL_G_HighlightNodes(TopologyGraph,ListOfNodes,NodeColor,BorderThickness,NodeDiameter,WindowIndex);// Highlight the specified nodes(labs) in red color

WindoeIndex=3; //Graph Window Number
[VisualizeGraph2] = NL_G_ShowGraphNE(TopologyGraph,WindoeIndex);// Visualize the Graph along with indices for Nodes and Edges

//Display the number of nodes and edges 
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 

EdgeIndex=7;//edge index
NewNodeQuantity=z;//quantity of new nodes
[go]=NL_G_SplitEdge(TopologyGraph,EdgeIndex,NewNodeQuantity);//application of NL_G_SplitEdge
WindowIndex=3;//window index
VisualizeGraph1=NL_G_ShowGraphNE(go,WindowIndex)//visualise graph

NewEdgeHeadVector=[1 2];//head vector of new edges

for i=3:NumberOfNodes//insert nodes in the headVector
    NewEdgeHeadVector($+1)=i;//adding the nodes to headVector
end

NewEdgeTailVector=[2 3];//tail vector of new edges

for i=4:NumberOfNodes//insert nodes in the tailVector
    NewEdgeTailVector($+1)=i;//adding the nodes to tailVector
end

NewEdgeTailVector($+1)=1;//adding the nodes to tailVector

NewEdgeNameVector=['e5' 'e6' 'e7' 'e8'];//name vector of new edges
[TopologyGraph]  = NL_G_AddEdges(go,NewEdgeHeadVector,NewEdgeTailVector,NewEdgeNameVector);//Add edges to graph
WindowIndex=4;//window index
VisualizeGraph1=NL_G_ShowGraphNE(TopologyGraph,WindowIndex);//display graph

// Display the number of nodes and edges again after adding the nodes and edges. 
[ExtractNode,ExtractEdge]=NL_G_GraphSize(TopologyGraph);//Extract the number of nodes and edges
disp(ExtractNode,ExtractEdge); //display the number of nodes and edges 



