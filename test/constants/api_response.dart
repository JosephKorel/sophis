const gptResponse = {
  'id': 'chatcmpl-abc123',
  'object': 'chat.completion',
  'created': 1677858242,
  'model': 'gpt-3.5-turbo-0613',
  'usage': {'prompt_tokens': 13, 'completion_tokens': 7, 'total_tokens': 20},
  'choices': [
    {
      'message': {'role': 'assistant', 'content': 'This is a test'},
      'finish_reason': 'stop',
      'index': 0,
    }
  ],
};
