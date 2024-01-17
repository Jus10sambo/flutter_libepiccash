/*
 * This file is part of Stack Wallet.
 *
 * Copyright (c) 2023 Cypher Stack
 * All Rights Reserved.
 * The code is distributed under GPLv3 license, see LICENSE file for details.
 * Generated by Cypher Stack on 2023-10-03
 *
 */

class Transaction {
  final String parentKeyId;
  final int id;
  final String? txSlateId;
  final TransactionType txType;
  final String creationTs;
  final String confirmationTs;
  final bool confirmed;
  final int numInputs;
  final int numOutputs;
  final String amountCredited;
  final String amountDebited;
  final String? fee;
  final String? ttlCutoffHeight;
  final Messages? messages;
  final String? storedTx;
  final String? kernelExcess;
  final int? kernelLookupMinHeight;
  final String? paymentProof;

  Transaction({
    required this.parentKeyId,
    required this.id,
    this.txSlateId,
    required this.txType,
    required this.creationTs,
    required this.confirmationTs,
    required this.confirmed,
    required this.numInputs,
    required this.numOutputs,
    required this.amountCredited,
    required this.amountDebited,
    this.fee,
    this.ttlCutoffHeight,
    this.messages,
    this.storedTx,
    this.kernelExcess,
    this.kernelLookupMinHeight,
    this.paymentProof,
  });

  factory Transaction.fromJson(dynamic json) {
    print("THIS JSON IS $json");
    return Transaction(
      parentKeyId: json['parent_key_id'] as String,
      id: int.parse(json!['id'].toString()),
      txSlateId: json['tx_slate_id'] as String?,
      txType: TransactionType.values.byName(json['tx_type'] as String),
      creationTs: json['creation_ts'].toString(),
      confirmationTs: json['confirmation_ts'].toString(),
      confirmed: bool.parse(json['confirmed'].toString()),
      numInputs: int.parse(json['num_inputs'].toString()),
      numOutputs: int.parse(json['num_outputs'].toString()),
      amountCredited: json['amount_credited'] as String,
      amountDebited: json['amount_debited'] as String,
      fee: json['fee'].toString(),
      ttlCutoffHeight: json['ttl_cutoff_height'].toString(),
      messages: json['messages'] != null
          ? Messages.fromJson(json['messages'] as Map<String, dynamic>)
          : null,
      storedTx: json['stored_tx'].toString(),
      kernelExcess: json['kernel_excess'].toString(),
      kernelLookupMinHeight: json['kernel_lookup_min_height'] == null
          ? null
          : int.parse(json['kernel_lookup_min_height'].toString()),
      paymentProof: json['payment_proof'] as String?,
    );
  }
}

class Messages {
  final List<Message> messages;

  Messages({required this.messages});

  factory Messages.fromJson(Map<String, dynamic> json) {
    final messageList = json['messages'] as List<dynamic>;
    final messages = messageList
        .map((message) => Message.fromJson(message as Map<String, dynamic>))
        .toList();
    return Messages(messages: messages);
  }
}

class Message {
  final String id;
  final String publicKey;
  final String? message;
  final String? messageSig;

  Message({
    required this.id,
    required this.publicKey,
    this.message,
    this.messageSig,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'].toString(),
      publicKey: json['public_key'].toString(),
      message: json['message'].toString(),
      messageSig: json['message_sig'].toString(),
    );
  }
}

enum TransactionType {
  TxReceived,
  TxReceivedCancelled,
  TxSent,
  TxSentCancelled,
  ConfirmedCoinbase,
  // UnconfirmedCoinbase, // This probably also exists.
}
