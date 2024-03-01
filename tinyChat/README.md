# TinyChat: A Concurrent Chat Application in Erlang

## Overview

TinyChat is a lightweight, highly concurrent chat application developed in Erlang, showcasing the language's powerful capabilities for building scalable, real-time messaging systems. This project demonstrates Erlang's process model, message passing, and fault tolerance features, making it an excellent portfolio piece for those interested in distributed systems and functional programming.

## Features

**Client Management:** Users can connect/disconnect, change their nicknames, and join or leave chatrooms.
**Chatrooms:** Supports multiple chatrooms with the ability to broadcast messages to all members.
**Concurrency:** Utilizes Erlang's lightweight processes for handling multiple users and chatrooms concurrently.
**Real-time Communication:** Messages are delivered in real-time across clients and chatrooms.
Architecture
**Server:** Acts as the central node managing client connections, chatroom creation, and routing messages.
**Clients:** Connect to the server, sending and receiving messages, and interacting with chatrooms.
**Chatrooms:** Managed by the server, allowing multiple clients to join, leave, and communicate.
Technologies Used
**Erlang/OTP:** The application is entirely written in Erlang, leveraging its OTP framework for managing the application's architecture and concurrency model.

# Architecture diagram

![layout of process and connects](https://github.com/Chinmay-395/CS511-Concurrent-Programming/blob/deploy/tinyChat/figure1.png)

<br>
<p>The architecture emphasizes concurrent operations and message passing. The GUI acts as the interface for user commands, which are processed by clients. Clients interact with the server to manage their presence in chatrooms and with chatrooms directly for messaging. The server acts as a centralized point for managing the overall state of the system, including the registration of clients to chatrooms and the existence of chatrooms themselves. Chatrooms are responsible for managing active conversations and distributing messages among participants.

This architecture leverages Erlang's strengths in handling concurrency, distribution, and message passing, enabling real-time communication and interaction among users in a distributed chat system.

</p>

## Getting Started

To run TinyChat, ensure you have Erlang/OTP installed on your system. Clone the repository, navigate to the project directory, and start the Erlang shell with erl. Compile the modules and start the server with provided scripts in the documentation.

**step-1**: start the application `make run`<br>
**step-2**: compile the starting point of the program `main:start().`
this will create a GUI pop-window consisting of system-tab

| operations          | explaination                                                                                    |
| ------------------- | ----------------------------------------------------------------------------------------------- |
| /join               | #chatroom name join chatroom with name “#chatroom name”.                                        |
| /leave              | leave chatroom who’s tab is currently active/open.                                              |
| /leave              | #chatroom name leave chatroom with name “#chatroom name”.                                       |
| /whoami             | what is current nickname?                                                                       |
| /nick               | new nickname change nickname from current nickname to “new nickname”. Must start with lowercase |
| some string of text | send a message “some string of text” to chatroom who’s tab is currently active/open.            |
| /quit               | quit. Just that user’s GUI and client exit, while server and chatrooms stay running.            |

# Modules

TinyChat consists of these following primary actors or process types and their corresponding Erlang modules:

<ul>
<li> 
        <h4>GUIs (gui.erl):</h4>
        <p>
        The GUI module is provided as part of the project framework and is responsible for the graphical user interface of the chat application. It allows users to interact with the system through graphical elements, enabling operations like joining chatrooms, sending messages, and viewing chat histories. Users can execute commands through the GUI to interact with other components of TinyChat.
        </p>

</li>

<li> <h4>Clients (client.erl): </h4>
    <p>Clients represent the users of TinyChat. Each client process maintains its state, including the nickname (unique across the system) and the chatrooms to which it is currently connected. Clients communicate with the server to join or leave chatrooms and with chatrooms to send and receive messages. The client module showcases message passing and state management in a concurrent environment.</p>
</li>
<li> <h4>A server (server.erl): </h4>
    <p>The server acts as the central coordinator for TinyChat. It maintains a global state, including mappings from client PIDs to nicknames, chatroom names to lists of clients, and chatroom names to chatroom PIDs. The server handles client requests to join or leave chatrooms, ensures unique nicknames across the system, and spawns chatroom processes as needed. It exemplifies the handling of concurrent operations and state synchronization in Erlang.</p>
</li>
<li> <h4>Chatrooms (chatroom.erl): </h4>
    <p>Chatroom processes manage individual chat sessions. Each chatroom maintains a list of participants and a chat history. Chatrooms are responsible for broadcasting messages to all participants, showcasing Erlang's powerful message-passing capabilities. They interact with the server to update participant lists and with clients to receive and broadcast messages.</p>
</li>
<li><h4>Main (main.erl):</h4>
    <p>In addition to these four primary actors, TinyChat includes a main.erl module to bootstrap the application. This module initializes the system, starting the server and GUI processes, and facilitates the dynamic creation of chatrooms as users join them.</p>
</li>
</ul>

![example](https://github.com/Chinmay-395/CS511-Concurrent-Programming/blob/deploy/tinyChat/chat_example.png)
