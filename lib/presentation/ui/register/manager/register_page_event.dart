import 'package:flutter/cupertino.dart';
import 'package:health_sync/domain/entities/auth/register_request_entity.dart';

sealed class RegisterPageEvent{}



final class RegisterEvent extends RegisterPageEvent {
  final RegisterRequestEntity entity;
  final GlobalKey<FormState> key;


  RegisterEvent({required this.entity, required this.key});
}