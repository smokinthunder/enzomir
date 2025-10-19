# Firebase Backend Architecture for Enzomir Event App (Feature-First Structure)

> **✅ MIGRATION COMPLETED**: The project has been successfully migrated from layer-based to feature-first architecture.

## Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Firebase Schema Design](#firebase-schema-design)
4. [MVVM Architecture with Riverpod](#mvvm-architecture-with-riverpod)
5. [State Management](#state-management)
6. [Repositories](#repositories)
7. [ViewModels](#viewmodels)
8. [Providers](#providers)
9. [Models](#models)
10. [Implementation Guide](#implementation-guide)
11. [Error Handling](#error-handling)
12. [Best Practices](#best-practices)

## Overview

This document outlines the implementation of a Firebase backend for the Enzomir event discovery app using Riverpod state management and MVVM architecture pattern. The architecture is inspired by clean architecture principles and follows the same pattern used in the Flutter Spotify clone tutorial.

### Key Features
- **Authentication**: User registration, login, and session management
- **Event Management**: Create, read, update, delete events
- **User Profiles**: User information and preferences
- **Event Interactions**: Bookmarking, attending, rating events
- **Real-time Updates**: Live event updates and notifications
- **Search & Discovery**: Event filtering and search functionality

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── firebase_constants.dart
│   │   └── app_constants.dart
│   ├── failure/
│   │   └── failure.dart
│   ├── models/
│   │   ├── user_model.dart
│   │   └── base_model.dart
│   ├── providers/
│   │   ├── current_user_notifier.dart
│   │   ├── current_event_notifier.dart
│   │   └── firebase_providers.dart
│   ├── utils/
│   │   ├── utils.dart
│   │   └── validators.dart
│   └── theme/
├── features/
│   ├── auth/
│   │   ├── models/
│   │   │   └── auth_models.dart
│   │   ├── repositories/
│   │   │   ├── auth_remote_repository.dart
│   │   │   └── auth_local_repository.dart
│   │   ├── viewmodel/
│   │   │   └── auth_viewmodel.dart
│   │   └── view/
│   ├── events/
│   │   ├── models/
│   │   │   ├── event_model.dart
│   │   │   ├── event_category_model.dart
│   │   │   └── event_interaction_model.dart
│   │   ├── repositories/
│   │   │   ├── events_remote_repository.dart
│   │   │   └── events_local_repository.dart
│   │   ├── viewmodel/
│   │   │   └── events_viewmodel.dart
│   │   └── view/
│   ├── profile/
│   │   ├── models/
│   │   │   └── profile_model.dart
│   │   ├── repositories/
│   │   │   └── profile_repository.dart
│   │   ├── viewmodel/
│   │   │   └── profile_viewmodel.dart
│   │   └── view/
│   └── search/
│       ├── models/
│       │   └── search_model.dart
│       ├── repositories/
│       │   └── search_repository.dart
│       ├── viewmodel/
│       │   └── search_viewmodel.dart
│       └── view/
├── presentation/ (your existing UI code)
├── provider/ (global providers)
├── repository/ (base repository interfaces)
└── viewmodel/ (base viewmodel classes)
```

## Firebase Schema Design

### Firestore Collections

#### 1. Users Collection (`users`)
```json
{
  "userId": "unique_user_id",
  "data": {
    "name": "John Doe",
    "email": "john@example.com",
    "profileImageUrl": "https://...",
    "dateOfBirth": "1990-01-01",
    "location": {
      "city": "Mumbai",
      "state": "Maharashtra",
      "country": "India",
      "coordinates": {
        "latitude": 19.0760,
        "longitude": 72.8777
      }
    },
    "preferences": {
      "categories": ["music", "sports", "food"],
      "maxDistance": 50,
      "priceRange": {
        "min": 0,
        "max": 5000
      }
    },
    "stats": {
      "eventsAttended": 15,
      "eventsCreated": 3,
      "totalRating": 4.5
    },
    "createdAt": "2024-01-01T00:00:00Z",
    "updatedAt": "2024-01-01T00:00:00Z",
    "isActive": true
  }
}
```

#### 2. Events Collection (`events`)
```json
{
  "eventId": "unique_event_id",
  "data": {
    "title": "DJ Night Club Vista Mar",
    "description": "An amazing night of music and dancing...",
    "imageUrls": [
      "https://...",
      "https://..."
    ],
    "category": "music",
    "subcategory": "electronic",
    "organizer": {
      "userId": "organizer_user_id",
      "name": "Event Organizer",
      "contactInfo": {
        "phone": "+91-9876543210",
        "email": "organizer@example.com"
      }
    },
    "dateTime": {
      "startDate": "2024-06-10T20:00:00Z",
      "endDate": "2024-06-11T02:00:00Z",
      "timezone": "Asia/Kolkata"
    },
    "location": {
      "venue": "Club Vista Mar",
      "address": "Marine Drive, Kochi, Kerala",
      "city": "Kochi",
      "state": "Kerala",
      "country": "India",
      "coordinates": {
        "latitude": 9.9312,
        "longitude": 76.2673
      }
    },
    "pricing": {
      "type": "paid", // "free", "paid", "donation"
      "currency": "INR",
      "tickets": [
        {
          "type": "early_bird",
          "price": 1500,
          "quantity": 100,
          "sold": 45,
          "description": "Early bird discount"
        },
        {
          "type": "regular",
          "price": 2000,
          "quantity": 200,
          "sold": 80,
          "description": "Regular ticket"
        }
      ]
    },
    "capacity": {
      "total": 300,
      "attending": 125,
      "interested": 45
    },
    "tags": ["dj", "nightlife", "electronic", "party"],
    "ageRestriction": {
      "minimum": 18,
      "maximum": null
    },
    "status": "active", // "draft", "active", "cancelled", "completed"
    "visibility": "public", // "public", "private", "invite_only"
    "createdAt": "2024-01-01T00:00:00Z",
    "updatedAt": "2024-01-01T00:00:00Z"
  }
}
```

#### 3. Event Interactions Collection (`event_interactions`)
```json
{
  "interactionId": "unique_interaction_id",
  "data": {
    "userId": "user_id",
    "eventId": "event_id",
    "type": "attending", // "attending", "interested", "bookmarked"
    "createdAt": "2024-01-01T00:00:00Z",
    "metadata": {
      "ticketType": "regular",
      "ticketQuantity": 2,
      "totalAmount": 4000
    }
  }
}
```

#### 4. Event Categories Collection (`event_categories`)
```json
{
  "categoryId": "unique_category_id",
  "data": {
    "name": "Music",
    "slug": "music",
    "iconUrl": "https://...",
    "subcategories": [
      {
        "name": "Electronic",
        "slug": "electronic"
      },
      {
        "name": "Rock",
        "slug": "rock"
      }
    ],
    "isActive": true,
    "order": 1
  }
}
```

#### 5. User Bookmarks Collection (`user_bookmarks`)
```json
{
  "bookmarkId": "unique_bookmark_id",
  "data": {
    "userId": "user_id",
    "eventId": "event_id",
    "createdAt": "2024-01-01T00:00:00Z"
  }
}
```

### Security Rules

```javascript
// Firestore Security Rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read and write their own user document
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Events are readable by all authenticated users
    match /events/{eventId} {
      allow read: if request.auth != null;
      allow write: if request.auth != null && 
        (resource == null || request.auth.uid == resource.data.organizer.userId);
    }
    
    // Event interactions are readable and writable by the user
    match /event_interactions/{interactionId} {
      allow read, write: if request.auth != null && 
        request.auth.uid == resource.data.userId;
    }
    
    // Categories are readable by all authenticated users
    match /event_categories/{categoryId} {
      allow read: if request.auth != null;
      allow write: if false; // Only admins can write (handled server-side)
    }
    
    // User bookmarks are readable and writable by the user
    match /user_bookmarks/{bookmarkId} {
      allow read, write: if request.auth != null && 
        request.auth.uid == resource.data.userId;
    }
  }
}
```

## MVVM Architecture with Riverpod

### Architecture Principles

1. **Separation of Concerns**: Clear separation between UI, business logic, and data layers
2. **Dependency Injection**: Using Riverpod for dependency injection
3. **State Management**: Reactive state management with Riverpod
4. **Error Handling**: Consistent error handling across the app
5. **Code Generation**: Using Riverpod code generation for type safety

### Layer Responsibilities

- **View (Presentation)**: Your existing UI components
- **ViewModel**: Business logic and state management
- **Repository**: Data access layer (Firebase operations)
- **Model**: Data structures and entities

## State Management

### Core Providers

#### Current User Notifier
```dart
// lib/core/providers/current_user_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:enzomir/core/models/user_model.dart';

part 'current_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  @override
  UserModel? build() {
    return null;
  }

  void addUser(UserModel user) {
    state = user;
  }

  void updateUser(UserModel user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }

  void updateUserPreferences(Map<String, dynamic> preferences) {
    if (state != null) {
      state = state!.copyWith(preferences: preferences);
    }
  }
}
```

#### Current Event Notifier
```dart
// lib/core/providers/current_event_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:enzomir/features/events/models/event_model.dart';

part 'current_event_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentEventNotifier extends _$CurrentEventNotifier {
  @override
  EventModel? build() {
    return null;
  }

  void setCurrentEvent(EventModel event) {
    state = event;
  }

  void clearCurrentEvent() {
    state = null;
  }

  void updateEventAttendance(int newCount) {
    if (state != null) {
      state = state!.copyWith(
        capacity: state!.capacity.copyWith(attending: newCount),
      );
    }
  }
}
```

### Firebase Providers
```dart
// lib/core/providers/firebase_providers.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) {
  return FirebaseStorage.instance;
}
```

## Repositories

### Base Repository Interface
```dart
// lib/repository/base_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:enzomir/core/failure/failure.dart';

abstract class BaseRepository {
  Future<Either<AppFailure, T>> handleFirebaseCall<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();
      return Right(result);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
```

### Auth Repository
```dart
// lib/features/auth/repositories/auth_remote_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:enzomir/core/failure/failure.dart';
import 'package:enzomir/core/models/user_model.dart';
import 'package:enzomir/core/providers/firebase_providers.dart';
import 'package:enzomir/repository/base_repository.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
  );
}

class AuthRemoteRepository extends BaseRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRemoteRepository({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  Future<Either<AppFailure, UserModel>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    return handleFirebaseCall(() async {
      // Create user with Firebase Auth
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user document in Firestore
      final userModel = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        profileImageUrl: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isActive: true,
      );

      await _firebaseFirestore
          .collection('users')
          .doc(credential.user!.uid)
          .set(userModel.toMap());

      return userModel;
    });
  }

  Future<Either<AppFailure, UserModel>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return handleFirebaseCall(() async {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await _firebaseFirestore
          .collection('users')
          .doc(credential.user!.uid)
          .get();

      if (!userDoc.exists) {
        throw Exception('User data not found');
      }

      return UserModel.fromMap(userDoc.data()!);
    });
  }

  Future<Either<AppFailure, void>> signOut() async {
    return handleFirebaseCall(() async {
      await _firebaseAuth.signOut();
    });
  }

  Future<Either<AppFailure, UserModel?>> getCurrentUser() async {
    return handleFirebaseCall(() async {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) return null;

      final userDoc = await _firebaseFirestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (!userDoc.exists) return null;

      return UserModel.fromMap(userDoc.data()!);
    });
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
```

### Events Repository
```dart
// lib/features/events/repositories/events_remote_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:enzomir/core/failure/failure.dart';
import 'package:enzomir/features/events/models/event_model.dart';
import 'package:enzomir/features/events/models/event_interaction_model.dart';
import 'package:enzomir/core/providers/firebase_providers.dart';
import 'package:enzomir/repository/base_repository.dart';

part 'events_remote_repository.g.dart';

@riverpod
EventsRemoteRepository eventsRemoteRepository(EventsRemoteRepositoryRef ref) {
  return EventsRemoteRepository(
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
  );
}

class EventsRemoteRepository extends BaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  EventsRemoteRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<Either<AppFailure, List<EventModel>>> getUpcomingEvents({
    int limit = 20,
    String? category,
  }) async {
    return handleFirebaseCall(() async {
      Query query = _firebaseFirestore
          .collection('events')
          .where('status', isEqualTo: 'active')
          .where('dateTime.startDate', isGreaterThan: DateTime.now())
          .orderBy('dateTime.startDate')
          .limit(limit);

      if (category != null && category.isNotEmpty) {
        query = query.where('category', isEqualTo: category);
      }

      final querySnapshot = await query.get();
      return querySnapshot.docs
          .map((doc) => EventModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  Future<Either<AppFailure, List<EventModel>>> getNearbyEvents({
    required double latitude,
    required double longitude,
    double radiusInKm = 50,
    int limit = 20,
  }) async {
    return handleFirebaseCall(() async {
      // Note: For production, use GeoFlutterFire for proper geospatial queries
      final querySnapshot = await _firebaseFirestore
          .collection('events')
          .where('status', isEqualTo: 'active')
          .where('dateTime.startDate', isGreaterThan: DateTime.now())
          .limit(limit)
          .get();

      final events = querySnapshot.docs
          .map((doc) => EventModel.fromMap(doc.data()))
          .toList();

      // Filter by distance (simplified - use proper geospatial library in production)
      return events.where((event) {
        final distance = _calculateDistance(
          latitude,
          longitude,
          event.location.coordinates.latitude,
          event.location.coordinates.longitude,
        );
        return distance <= radiusInKm;
      }).toList();
    });
  }

  Future<Either<AppFailure, EventModel>> createEvent({
    required EventModel event,
  }) async {
    return handleFirebaseCall(() async {
      final docRef = _firebaseFirestore.collection('events').doc();
      final eventWithId = event.copyWith(id: docRef.id);
      
      await docRef.set(eventWithId.toMap());
      return eventWithId;
    });
  }

  Future<Either<AppFailure, void>> attendEvent({
    required String userId,
    required String eventId,
    required String ticketType,
    required int quantity,
  }) async {
    return handleFirebaseCall(() async {
      final batch = _firebaseFirestore.batch();

      // Add interaction
      final interactionRef = _firebaseFirestore
          .collection('event_interactions')
          .doc();
      
      final interaction = EventInteractionModel(
        id: interactionRef.id,
        userId: userId,
        eventId: eventId,
        type: EventInteractionType.attending,
        createdAt: DateTime.now(),
        metadata: {
          'ticketType': ticketType,
          'ticketQuantity': quantity,
        },
      );

      batch.set(interactionRef, interaction.toMap());

      // Update event attendance count
      final eventRef = _firebaseFirestore.collection('events').doc(eventId);
      batch.update(eventRef, {
        'capacity.attending': FieldValue.increment(quantity),
      });

      await batch.commit();
    });
  }

  Future<Either<AppFailure, void>> bookmarkEvent({
    required String userId,
    required String eventId,
  }) async {
    return handleFirebaseCall(() async {
      final bookmarkRef = _firebaseFirestore
          .collection('user_bookmarks')
          .doc();

      await bookmarkRef.set({
        'userId': userId,
        'eventId': eventId,
        'createdAt': DateTime.now(),
      });
    });
  }

  Future<Either<AppFailure, List<EventModel>>> getUserBookmarkedEvents({
    required String userId,
  }) async {
    return handleFirebaseCall(() async {
      final bookmarksSnapshot = await _firebaseFirestore
          .collection('user_bookmarks')
          .where('userId', isEqualTo: userId)
          .get();

      final eventIds = bookmarksSnapshot.docs
          .map((doc) => doc.data()['eventId'] as String)
          .toList();

      if (eventIds.isEmpty) return <EventModel>[];

      final eventsSnapshot = await _firebaseFirestore
          .collection('events')
          .where(FieldPath.documentId, whereIn: eventIds)
          .get();

      return eventsSnapshot.docs
          .map((doc) => EventModel.fromMap(doc.data()))
          .toList();
    });
  }

  Stream<List<EventModel>> getEventsStream({
    String? category,
    int limit = 20,
  }) {
    Query query = _firebaseFirestore
        .collection('events')
        .where('status', isEqualTo: 'active')
        .where('dateTime.startDate', isGreaterThan: DateTime.now())
        .orderBy('dateTime.startDate')
        .limit(limit);

    if (category != null && category.isNotEmpty) {
      query = query.where('category', isEqualTo: category);
    }

    return query.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => EventModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Haversine formula for calculating distance between two points
    // This is a simplified implementation
    // For production, use a proper geospatial library
    return 0.0; // Placeholder
  }
}
```

## ViewModels

### Auth ViewModel
```dart
// lib/features/auth/viewmodel/auth_viewmodel.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:enzomir/core/models/user_model.dart';
import 'package:enzomir/core/providers/current_user_notifier.dart';
import 'package:enzomir/features/auth/repositories/auth_remote_repository.dart';
import 'package:enzomir/features/auth/repositories/auth_local_repository.dart';
import 'package:fpdart/fpdart.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;
  late AuthLocalRepository _authLocalRepository;
  late CurrentUserNotifier _currentUserNotifier;

  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _authLocalRepository = ref.watch(authLocalRepositoryProvider);
    _currentUserNotifier = ref.watch(currentUserNotifierProvider.notifier);
    return null;
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    
    final result = await _authRemoteRepository.signUpWithEmail(
      name: name,
      email: email,
      password: password,
    );

    state = switch (result) {
      Left(value: final failure) => AsyncValue.error(
          failure.message,
          StackTrace.current,
        ),
      Right(value: final user) => AsyncValue.data(user),
    };
  }

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    
    final result = await _authRemoteRepository.signInWithEmail(
      email: email,
      password: password,
    );

    state = switch (result) {
      Left(value: final failure) => AsyncValue.error(
          failure.message,
          StackTrace.current,
        ),
      Right(value: final user) => _signInSuccess(user),
    };
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    
    final result = await _authRemoteRepository.signOut();
    
    state = switch (result) {
      Left(value: final failure) => AsyncValue.error(
          failure.message,
          StackTrace.current,
        ),
      Right(value: _) => _signOutSuccess(),
    };
  }

  Future<void> getCurrentUser() async {
    state = const AsyncValue.loading();
    
    final result = await _authRemoteRepository.getCurrentUser();
    
    state = switch (result) {
      Left(value: final failure) => AsyncValue.error(
          failure.message,
          StackTrace.current,
        ),
      Right(value: final user) => user != null 
          ? AsyncValue.data(user)
          : const AsyncValue.data(null),
    };
  }

  AsyncValue<UserModel> _signInSuccess(UserModel user) {
    _currentUserNotifier.addUser(user);
    _authLocalRepository.setUserLoggedIn(true);
    return AsyncValue.data(user);
  }

  AsyncValue<UserModel?> _signOutSuccess() {
    _currentUserNotifier.removeUser();
    _authLocalRepository.setUserLoggedIn(false);
    return const AsyncValue.data(null);
  }
}
```

### Events ViewModel
```dart
// lib/features/events/viewmodel/events_viewmodel.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:enzomir/features/events/models/event_model.dart';
import 'package:enzomir/features/events/repositories/events_remote_repository.dart';
import 'package:enzomir/core/providers/current_user_notifier.dart';
import 'package:fpdart/fpdart.dart';

part 'events_viewmodel.g.dart';

@riverpod
Future<List<EventModel>> getUpcomingEvents(
  GetUpcomingEventsRef ref, {
  String? category,
  int limit = 20,
}) async {
  final eventsRepository = ref.watch(eventsRemoteRepositoryProvider);
  
  final result = await eventsRepository.getUpcomingEvents(
    category: category,
    limit: limit,
  );

  return switch (result) {
    Left(value: final failure) => throw failure.message,
    Right(value: final events) => events,
  };
}

@riverpod
Future<List<EventModel>> getNearbyEvents(
  GetNearbyEventsRef ref, {
  required double latitude,
  required double longitude,
  double radiusInKm = 50,
  int limit = 20,
}) async {
  final eventsRepository = ref.watch(eventsRemoteRepositoryProvider);
  
  final result = await eventsRepository.getNearbyEvents(
    latitude: latitude,
    longitude: longitude,
    radiusInKm: radiusInKm,
    limit: limit,
  );

  return switch (result) {
    Left(value: final failure) => throw failure.message,
    Right(value: final events) => events,
  };
}

@riverpod
Future<List<EventModel>> getUserBookmarkedEvents(
  GetUserBookmarkedEventsRef ref,
) async {
  final currentUser = ref.watch(currentUserNotifierProvider);
  if (currentUser == null) return [];

  final eventsRepository = ref.watch(eventsRemoteRepositoryProvider);
  
  final result = await eventsRepository.getUserBookmarkedEvents(
    userId: currentUser.id,
  );

  return switch (result) {
    Left(value: final failure) => throw failure.message,
    Right(value: final events) => events,
  };
}

@riverpod
class EventsViewModel extends _$EventsViewModel {
  late EventsRemoteRepository _eventsRepository;

  @override
  AsyncValue<String>? build() {
    _eventsRepository = ref.watch(eventsRemoteRepositoryProvider);
    return null;
  }

  Future<void> createEvent({
    required EventModel event,
  }) async {
    state = const AsyncValue.loading();
    
    final result = await _eventsRepository.createEvent(event: event);
    
    state = switch (result) {
      Left(value: final failure) => AsyncValue.error(
          failure.message,
          StackTrace.current,
        ),
      Right(value: final event) => AsyncValue.data(event.id),
    };
  }

  Future<void> attendEvent({
    required String eventId,
    required String ticketType,
    required int quantity,
  }) async {
    final currentUser = ref.read(currentUserNotifierProvider);
    if (currentUser == null) {
      state = AsyncValue.error('User not logged in', StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    
    final result = await _eventsRepository.attendEvent(
      userId: currentUser.id,
      eventId: eventId,
      ticketType: ticketType,
      quantity: quantity,
    );
    
    state = switch (result) {
      Left(value: final failure) => AsyncValue.error(
          failure.message,
          StackTrace.current,
        ),
      Right(value: _) => const AsyncValue.data('Event attended successfully'),
    };
  }

  Future<void> bookmarkEvent({
    required String eventId,
  }) async {
    final currentUser = ref.read(currentUserNotifierProvider);
    if (currentUser == null) {
      state = AsyncValue.error('User not logged in', StackTrace.current);
      return;
    }

    final result = await _eventsRepository.bookmarkEvent(
      userId: currentUser.id,
      eventId: eventId,
    );
    
    switch (result) {
      case Left(value: final failure):
        // Handle error silently or show snackbar
        break;
      case Right(value: _):
        // Invalidate bookmarked events to refresh
        ref.invalidate(getUserBookmarkedEventsProvider);
        break;
    }
  }
}

@riverpod
Stream<List<EventModel>> eventsStream(
  EventsStreamRef ref, {
  String? category,
  int limit = 20,
}) {
  final eventsRepository = ref.watch(eventsRemoteRepositoryProvider);
  
  return eventsRepository.getEventsStream(
    category: category,
    limit: limit,
  );
}
```

## Models

### User Model
```dart
// lib/core/models/user_model.dart
import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;
  final DateTime? dateOfBirth;
  final UserLocation? location;
  final UserPreferences preferences;
  final UserStats stats;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl = '',
    this.dateOfBirth,
    this.location,
    this.preferences = const UserPreferences(),
    this.stats = const UserStats(),
    required this.createdAt,
    required this.updatedAt,
    this.isActive = true,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    UserLocation? location,
    UserPreferences? preferences,
    UserStats? stats,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      location: location ?? this.location,
      preferences: preferences ?? this.preferences,
      stats: stats ?? this.stats,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'location': location?.toMap(),
      'preferences': preferences.toMap(),
      'stats': stats.toMap(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isActive': isActive,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      dateOfBirth: map['dateOfBirth'] != null 
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      location: map['location'] != null 
          ? UserLocation.fromMap(map['location'])
          : null,
      preferences: UserPreferences.fromMap(map['preferences'] ?? {}),
      stats: UserStats.fromMap(map['stats'] ?? {}),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isActive: map['isActive'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

class UserLocation {
  final String city;
  final String state;
  final String country;
  final Coordinates coordinates;

  const UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.coordinates,
  });

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'state': state,
      'country': country,
      'coordinates': coordinates.toMap(),
    };
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
      coordinates: Coordinates.fromMap(map['coordinates'] ?? {}),
    );
  }
}

class UserPreferences {
  final List<String> categories;
  final double maxDistance;
  final PriceRange priceRange;

  const UserPreferences({
    this.categories = const [],
    this.maxDistance = 50.0,
    this.priceRange = const PriceRange(),
  });

  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
      'maxDistance': maxDistance,
      'priceRange': priceRange.toMap(),
    };
  }

  factory UserPreferences.fromMap(Map<String, dynamic> map) {
    return UserPreferences(
      categories: List<String>.from(map['categories'] ?? []),
      maxDistance: map['maxDistance']?.toDouble() ?? 50.0,
      priceRange: PriceRange.fromMap(map['priceRange'] ?? {}),
    );
  }
}

class UserStats {
  final int eventsAttended;
  final int eventsCreated;
  final double totalRating;

  const UserStats({
    this.eventsAttended = 0,
    this.eventsCreated = 0,
    this.totalRating = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventsAttended': eventsAttended,
      'eventsCreated': eventsCreated,
      'totalRating': totalRating,
    };
  }

  factory UserStats.fromMap(Map<String, dynamic> map) {
    return UserStats(
      eventsAttended: map['eventsAttended']?.toInt() ?? 0,
      eventsCreated: map['eventsCreated']?.toInt() ?? 0,
      totalRating: map['totalRating']?.toDouble() ?? 0.0,
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }
}

class PriceRange {
  final double min;
  final double max;

  const PriceRange({
    this.min = 0.0,
    this.max = 10000.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'min': min,
      'max': max,
    };
  }

  factory PriceRange.fromMap(Map<String, dynamic> map) {
    return PriceRange(
      min: map['min']?.toDouble() ?? 0.0,
      max: map['max']?.toDouble() ?? 10000.0,
    );
  }
}
```

### Event Model
```dart
// lib/features/events/models/event_model.dart
import 'dart:convert';

class EventModel {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final String category;
  final String subcategory;
  final EventOrganizer organizer;
  final EventDateTime dateTime;
  final EventLocation location;
  final EventPricing pricing;
  final EventCapacity capacity;
  final List<String> tags;
  final AgeRestriction? ageRestriction;
  final String status;
  final String visibility;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrls = const [],
    required this.category,
    this.subcategory = '',
    required this.organizer,
    required this.dateTime,
    required this.location,
    required this.pricing,
    required this.capacity,
    this.tags = const [],
    this.ageRestriction,
    this.status = 'active',
    this.visibility = 'public',
    required this.createdAt,
    required this.updatedAt,
  });

  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? imageUrls,
    String? category,
    String? subcategory,
    EventOrganizer? organizer,
    EventDateTime? dateTime,
    EventLocation? location,
    EventPricing? pricing,
    EventCapacity? capacity,
    List<String>? tags,
    AgeRestriction? ageRestriction,
    String? status,
    String? visibility,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      organizer: organizer ?? this.organizer,
      dateTime: dateTime ?? this.dateTime,
      location: location ?? this.location,
      pricing: pricing ?? this.pricing,
      capacity: capacity ?? this.capacity,
      tags: tags ?? this.tags,
      ageRestriction: ageRestriction ?? this.ageRestriction,
      status: status ?? this.status,
      visibility: visibility ?? this.visibility,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'category': category,
      'subcategory': subcategory,
      'organizer': organizer.toMap(),
      'dateTime': dateTime.toMap(),
      'location': location.toMap(),
      'pricing': pricing.toMap(),
      'capacity': capacity.toMap(),
      'tags': tags,
      'ageRestriction': ageRestriction?.toMap(),
      'status': status,
      'visibility': visibility,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      category: map['category'] ?? '',
      subcategory: map['subcategory'] ?? '',
      organizer: EventOrganizer.fromMap(map['organizer'] ?? {}),
      dateTime: EventDateTime.fromMap(map['dateTime'] ?? {}),
      location: EventLocation.fromMap(map['location'] ?? {}),
      pricing: EventPricing.fromMap(map['pricing'] ?? {}),
      capacity: EventCapacity.fromMap(map['capacity'] ?? {}),
      tags: List<String>.from(map['tags'] ?? []),
      ageRestriction: map['ageRestriction'] != null
          ? AgeRestriction.fromMap(map['ageRestriction'])
          : null,
      status: map['status'] ?? 'active',
      visibility: map['visibility'] ?? 'public',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source));
}

// Additional supporting classes for EventModel...
class EventOrganizer {
  final String userId;
  final String name;
  final ContactInfo contactInfo;

  const EventOrganizer({
    required this.userId,
    required this.name,
    required this.contactInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'contactInfo': contactInfo.toMap(),
    };
  }

  factory EventOrganizer.fromMap(Map<String, dynamic> map) {
    return EventOrganizer(
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      contactInfo: ContactInfo.fromMap(map['contactInfo'] ?? {}),
    );
  }
}

class ContactInfo {
  final String phone;
  final String email;

  const ContactInfo({
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'email': email,
    };
  }

  factory ContactInfo.fromMap(Map<String, dynamic> map) {
    return ContactInfo(
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

class EventDateTime {
  final DateTime startDate;
  final DateTime endDate;
  final String timezone;

  const EventDateTime({
    required this.startDate,
    required this.endDate,
    required this.timezone,
  });

  Map<String, dynamic> toMap() {
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'timezone': timezone,
    };
  }

  factory EventDateTime.fromMap(Map<String, dynamic> map) {
    return EventDateTime(
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      timezone: map['timezone'] ?? 'UTC',
    );
  }
}

class EventLocation {
  final String venue;
  final String address;
  final String city;
  final String state;
  final String country;
  final Coordinates coordinates;

  const EventLocation({
    required this.venue,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.coordinates,
  });

  Map<String, dynamic> toMap() {
    return {
      'venue': venue,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'coordinates': coordinates.toMap(),
    };
  }

  factory EventLocation.fromMap(Map<String, dynamic> map) {
    return EventLocation(
      venue: map['venue'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
      coordinates: Coordinates.fromMap(map['coordinates'] ?? {}),
    );
  }
}

class EventPricing {
  final String type; // 'free', 'paid', 'donation'
  final String currency;
  final List<TicketType> tickets;

  const EventPricing({
    required this.type,
    this.currency = 'INR',
    this.tickets = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'currency': currency,
      'tickets': tickets.map((ticket) => ticket.toMap()).toList(),
    };
  }

  factory EventPricing.fromMap(Map<String, dynamic> map) {
    return EventPricing(
      type: map['type'] ?? 'free',
      currency: map['currency'] ?? 'INR',
      tickets: List<TicketType>.from(
        (map['tickets'] ?? []).map((ticket) => TicketType.fromMap(ticket)),
      ),
    );
  }
}

class TicketType {
  final String type;
  final double price;
  final int quantity;
  final int sold;
  final String description;

  const TicketType({
    required this.type,
    required this.price,
    required this.quantity,
    this.sold = 0,
    this.description = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'price': price,
      'quantity': quantity,
      'sold': sold,
      'description': description,
    };
  }

  factory TicketType.fromMap(Map<String, dynamic> map) {
    return TicketType(
      type: map['type'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      sold: map['sold']?.toInt() ?? 0,
      description: map['description'] ?? '',
    );
  }
}

class EventCapacity {
  final int total;
  final int attending;
  final int interested;

  const EventCapacity({
    required this.total,
    this.attending = 0,
    this.interested = 0,
  });

  EventCapacity copyWith({
    int? total,
    int? attending,
    int? interested,
  }) {
    return EventCapacity(
      total: total ?? this.total,
      attending: attending ?? this.attending,
      interested: interested ?? this.interested,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'attending': attending,
      'interested': interested,
    };
  }

  factory EventCapacity.fromMap(Map<String, dynamic> map) {
    return EventCapacity(
      total: map['total']?.toInt() ?? 0,
      attending: map['attending']?.toInt() ?? 0,
      interested: map['interested']?.toInt() ?? 0,
    );
  }
}

class AgeRestriction {
  final int? minimum;
  final int? maximum;

  const AgeRestriction({
    this.minimum,
    this.maximum,
  });

  Map<String, dynamic> toMap() {
    return {
      'minimum': minimum,
      'maximum': maximum,
    };
  }

  factory AgeRestriction.fromMap(Map<String, dynamic> map) {
    return AgeRestriction(
      minimum: map['minimum']?.toInt(),
      maximum: map['maximum']?.toInt(),
    );
  }
}
```

## Implementation Guide

### Step 1: Add Firebase Dependencies

Add the following dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  # Existing dependencies...
  
  # Firebase
  firebase_core: ^3.8.0
  firebase_auth: ^5.3.3
  firebase_firestore: ^5.4.8
  firebase_storage: ^12.3.7
  
  # Additional packages
  fpdart: ^1.1.0
  riverpod_annotation: ^3.0.3
  json_annotation: ^4.9.0
  
dev_dependencies:
  # Existing dev dependencies...
  
  # Code generation
  riverpod_generator: ^3.0.3
  build_runner: ^2.4.13
  json_serializable: ^6.8.0
```

### Step 2: Initialize Firebase

Create Firebase configuration and initialize it in your `main.dart`:

```dart
// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enzomir/firebase_options.dart';
import 'package:enzomir/core/providers/current_user_notifier.dart';
import 'package:enzomir/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:enzomir/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  final container = ProviderContainer();
  
  // Initialize auth state
  await container.read(authViewModelProvider.notifier).getCurrentUser();
  
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const EnzomirApp(),
    ),
  );
}
```

### Step 3: Create Core Components

1. **Failure Class**:
```dart
// lib/core/failure/failure.dart
class AppFailure {
  final String message;
  
  const AppFailure(this.message);
  
  @override
  String toString() => 'AppFailure: $message';
}
```

2. **Firebase Constants**:
```dart
// lib/core/constants/firebase_constants.dart
class FirebaseConstants {
  static const String usersCollection = 'users';
  static const String eventsCollection = 'events';
  static const String eventInteractionsCollection = 'event_interactions';
  static const String eventCategoriesCollection = 'event_categories';
  static const String userBookmarksCollection = 'user_bookmarks';
}
```

### Step 4: Generate Code

Run code generation for Riverpod:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 5: Update Your UI

Modify your existing UI components to use the new providers:

```dart
// Example: Update HomePage to use Firebase data
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingEventsAsync = ref.watch(getUpcomingEventsProvider());
    
    return Scaffold(
      body: upcomingEventsAsync.when(
        data: (events) => _buildHomeContent(events),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
  
  Widget _buildHomeContent(List<EventModel> events) {
    // Your existing UI code, but now using real Firebase data
    return Column(
      children: [
        // ... other widgets
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: events.map((event) => EventCard(
              imageUrl: event.imageUrls.isNotEmpty 
                  ? event.imageUrls.first 
                  : '',
              date: event.dateTime.startDate.day.toString(),
              month: _getMonthName(event.dateTime.startDate.month),
              title: event.title,
              // ... other properties
            )).toList(),
          ),
        ),
      ],
    );
  }
}
```

## Error Handling

### Consistent Error Handling Pattern

```dart
// lib/core/error/error_handler.dart
class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'No user found with this email.';
        case 'wrong-password':
          return 'Wrong password provided.';
        case 'email-already-in-use':
          return 'The account already exists for that email.';
        case 'weak-password':
          return 'The password provided is too weak.';
        default:
          return 'Authentication error: ${error.message}';
      }
    } else if (error is FirebaseException) {
      return 'Database error: ${error.message}';
    } else {
      return 'An unexpected error occurred: $error';
    }
  }
}
```

### Error UI Component

```dart
// lib/presentation/widgets/error_widget.dart
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorDisplayWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[300],
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
```

## Best Practices

### 1. Security Rules
- Always implement proper Firestore security rules
- Validate data on both client and server side
- Use user authentication for all sensitive operations

### 2. Performance Optimization
- Use pagination for large lists
- Implement local caching with Hive or SharedPreferences
- Use Firestore's offline capabilities
- Optimize images and use Firebase Storage

### 3. State Management
- Keep providers focused and single-purpose
- Use `keepAlive: true` for global state
- Implement proper loading and error states
- Use `ref.invalidate()` to refresh data when needed

### 4. Code Organization
- Follow the established folder structure
- Use meaningful names for providers and models
- Implement proper error handling at every layer
- Write unit tests for business logic

### 5. Firebase Best Practices
- Use subcollections for related data
- Implement proper indexing for queries
- Use Cloud Functions for complex server-side logic
- Monitor usage with Firebase Analytics

### 6. Testing
```dart
// Example test for AuthViewModel
void main() {
  group('AuthViewModel Tests', () {
    late ProviderContainer container;
    
    setUp(() {
      container = ProviderContainer();
    });
    
    tearDown(() {
      container.dispose();
    });
    
    test('should sign in user successfully', () async {
      // Mock repository
      final authViewModel = container.read(authViewModelProvider.notifier);
      
      await authViewModel.signInUser(
        email: 'test@example.com',
        password: 'password123',
      );
      
      final state = container.read(authViewModelProvider);
      expect(state?.hasValue, true);
    });
  });
}
```

This architecture provides a solid foundation for your event discovery app with Firebase backend. The MVVM pattern with Riverpod ensures clean separation of concerns, while the repository pattern makes testing easier and allows for future backend changes.

Remember to:
1. Set up Firebase project and add configuration files
2. Implement proper error handling throughout the app
3. Add appropriate loading states in your UI
4. Test thoroughly with real data
5. Implement proper security rules before going to production

The architecture is scalable and follows Flutter best practices, making it easy to maintain and extend as your app grows.